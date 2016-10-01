
//
//  ViewController.swift
//  MVFeedbackBanner
//
//  Created by Andrea Bizzotto on 28/09/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit
import MVFeedbackBanner


class ViewController: UIViewController, MVFeedbackBannerControllerDelegate {

    @IBOutlet private var feedbackBanner: MVFeedbackBanner!
    
    var bannerPresenter: MVFeedbackBannerPresenter!
    
    var bottomFeedbackBanner: MVFeedbackBanner!

    var bannerController: MVFeedbackBannerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showTopBanner()
        
        guard let navigationControllerView = self.navigationController?.view else {
            return
        }
        
        bannerPresenter = MVFeedbackBannerPresenter(parentView: navigationControllerView, delegate: self)
        
        bottomFeedbackBanner = bannerPresenter.banner
        
        bannerController = bannerPresenter.bannerController
    }
    
    
    func showTopBanner() {
        
        feedbackBanner.title = "Interface builder banner"
        feedbackBanner.negativeText = "Not really"
        feedbackBanner.positiveText = "Yeah!"
    }
    
    
    func feedbackBannerRequestedExit(status: MVFeedbackBannerExitStatus) {
        switch status {
        case .negativeDismiss: break
        case .negativeAction: break
        case .positiveDismiss: break
        case .positiveAction: break
        }
        
        bannerPresenter.setBannerHidden(true, animated: true)
    }
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        
        bannerController.reset()
        bannerPresenter.setBannerHidden(false, animated: true)
    }

}

