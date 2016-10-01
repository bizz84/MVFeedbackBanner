//
//  MVFeedbackBannerConfigurator.swift
//  MVFeedbackBannerFlow
//
//  Created by Andrea Bizzotto on 01/10/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit
import MVFeedbackBannerFlow

class MVFeedbackBannerConfigurator: NSObject {

    static func createBanner(parentView: UIView, delegate: MVFeedbackBannerControllerDelegate) -> (MVFeedbackBanner, MVFeedbackBannerController) {

        let banner = MVFeedbackBanner()
        
        attach(banner: banner, toBottomOf: parentView)
        
        let controller = createBannerController(banner: banner, delegate: delegate)
        
        return (banner, controller)
    }
    
    static func createBannerController(banner: MVFeedbackBanner, delegate: MVFeedbackBannerControllerDelegate) -> MVFeedbackBannerController {
        
        let initialColor = UIColor(red: 20.0/255.0, green: 160.0/255.0, blue: 1.0, alpha: 1.0)
        let negativeColor = UIColor(red: 220.0/255.0, green: 128.0/255.0, blue: 20.0/255.0, alpha: 1.0)
        let positiveColor = UIColor(red: 20.0/255.0, green: 192.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        
        let initialModel = MVFeedbackBannerModel(title: "Are you enjoying this app?",
                                                 negativeText: "Not really",
                                                 positiveText: "Yeah!",
                                                 backgroundColor: initialColor)
        
        let negativeModel = MVFeedbackBannerModel(title: "I'm so sorry to hear that! Could you tell me what happened?",
                                                  negativeText: "No!",
                                                  positiveText: "Okay",
                                                  backgroundColor: negativeColor)
        
        let positiveModel = MVFeedbackBannerModel(title: "Great! Let others know what you think of this app!",
                                                  negativeText: "No thanks",
                                                  positiveText: "Rate app",
                                                  backgroundColor: positiveColor)
        
        return MVFeedbackBannerController(feedbackBanner: banner,
                                          delegate: delegate,
                                          initialModel: initialModel,
                                          negativeModel: negativeModel,
                                          positiveModel: positiveModel)
    }
    
    static func attach(banner: MVFeedbackBanner, toBottomOf view: UIView) {
        
        view.addSubview(banner)
        
        let constraints = [
            banner.leftAnchor.constraint(equalTo: view.leftAnchor),
            banner.rightAnchor.constraint(equalTo: view.rightAnchor),
            banner.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        view.addConstraints(constraints)
    }

}
