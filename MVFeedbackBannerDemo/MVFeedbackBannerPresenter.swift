//
//  MVFeedbackBannerConfigurator.swift
//  MVFeedbackBanner
//
//  Created by Andrea Bizzotto on 01/10/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit
import MVFeedbackBanner

class MVFeedbackBannerPresenter: NSObject {
    
    unowned let parentView: UIView
    
    let banner: MVFeedbackBanner
    
    let bannerController: MVFeedbackBannerController
    
    let bannerBottomConstraint: NSLayoutConstraint

    func setBannerHidden(_ hidden: Bool, animated: Bool) {

        bannerBottomConstraint.constant = hidden ? banner.frame.height : 0.0
        parentView.setNeedsUpdateConstraints()
        let duration = animated ? 0.2 : 0.0
        UIView.animate(withDuration: duration) {
            self.parentView.layoutIfNeeded()
        }
    }
    
    init(parentView: UIView, delegate: MVFeedbackBannerControllerDelegate) {
    
        self.parentView = parentView
        self.banner = MVFeedbackBanner()
        self.bannerController = MVFeedbackBannerPresenter.createBannerController(banner: banner, delegate: delegate)
        
        parentView.addSubview(banner)
        
        bannerBottomConstraint = banner.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        
        let constraints = [
            banner.leftAnchor.constraint(equalTo: parentView.leftAnchor),
            banner.rightAnchor.constraint(equalTo: parentView.rightAnchor),
            bannerBottomConstraint
        ]
        parentView.addConstraints(constraints)
        
        super.init()

        parentView.layoutIfNeeded()
        setBannerHidden(true, animated: false)
    }
    
    static func createBannerController(banner: MVFeedbackBanner, delegate: MVFeedbackBannerControllerDelegate) -> MVFeedbackBannerController {
        
        let initialColor = UIColor(red: 20.0/255.0, green: 160.0/255.0, blue: 1.0, alpha: 1.0)
        let negativeColor = UIColor(red: 220.0/255.0, green: 128.0/255.0, blue: 20.0/255.0, alpha: 1.0)
        let positiveColor = UIColor(red: 20.0/255.0, green: 192.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        
        let initialAttributes = MVFeedbackBannerAttributes(title: "Are you enjoying this app?",
                                                 negativeText: "Not really",
                                                 positiveText: "Yeah!",
                                                 backgroundColor: initialColor)
        
        let negativeAttributes = MVFeedbackBannerAttributes(title: "I'm so sorry to hear that! Could you tell me what happened?",
                                                  negativeText: "No!",
                                                  positiveText: "Okay",
                                                  backgroundColor: negativeColor)
        
        let positiveAttributes = MVFeedbackBannerAttributes(title: "Great! Let others know what you think of this app!",
                                                  negativeText: "No thanks",
                                                  positiveText: "Rate app",
                                                  backgroundColor: positiveColor)
        
        return MVFeedbackBannerController(feedbackBanner: banner,
                                          delegate: delegate,
                                          initialAttributes: initialAttributes,
                                          negativeAttributes: negativeAttributes,
                                          positiveAttributes: positiveAttributes)
    }
}
