//
//  MVFeedbackBannerPresenterFadeIn.swift
//  MVFeedbackBanner
//
//  Created by Andrea Bizzotto on 01/10/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit
import MVFeedbackBanner

class MVFeedbackBannerPresenterFadeIn: NSObject, MVFeedbackBannerPresenter {

    unowned let parentView: UIView
    
    unowned let banner: MVFeedbackBanner

    init(parentView: UIView, banner: MVFeedbackBanner) {
        
        self.parentView = parentView
        self.banner = banner
    }
    
    var bannerHidden: Bool {
        get {
            return banner.alpha == 0.0
        }
        set {
            setBannerHidden(newValue, animated: false)
        }
    }

    func setBannerHidden(_ hidden: Bool, animated: Bool) {

        let duration = animated ? 0.2 : 0.0
        UIView.animate(withDuration: duration) {
            self.banner.alpha = hidden ? 0.0 : 1.0
        }
    }
}
