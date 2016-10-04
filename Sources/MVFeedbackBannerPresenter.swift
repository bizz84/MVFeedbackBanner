//
//  MVFeedbackBannerPresenter.swift
//  MVFeedbackBanner
//
//  Created by Andrea Bizzotto on 01/10/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

public protocol MVFeedbackBannerPresenter {
    
    var bannerHidden: Bool { get set }
    
    func setBannerHidden(_ hidden: Bool, animated: Bool)
}
