//
//  MVFeedbackBannerConfigurator.swift
//  MVFeedbackBanner
//
//  Created by Andrea Bizzotto on 01/10/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit
import MVFeedbackBanner

class MVFeedbackBannerPresenterSlideFromBottom: NSObject, MVFeedbackBannerPresenter {
    
    unowned let parentView: UIView
    
    unowned let banner: MVFeedbackBanner
    
    let bannerBottomConstraint: NSLayoutConstraint

    func setBannerHidden(_ hidden: Bool, animated: Bool) {

        bannerBottomConstraint.constant = hidden ? banner.frame.height : 0.0
        parentView.setNeedsUpdateConstraints()
        let duration = animated ? 0.2 : 0.0
        UIView.animate(withDuration: duration) {
            self.parentView.layoutIfNeeded()
        }
    }
    
    init(parentView: UIView, banner: MVFeedbackBanner) {
    
        self.parentView = parentView
        self.banner = banner
        
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
}
