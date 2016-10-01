//
//  ViewController.swift
//  MVFeedbackBannerFlowDemo
//
//  Created by Andrea Bizzotto on 28/09/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit
import MVFeedbackBannerFlow


class ViewController: UIViewController, MVFeedbackBannerControllerDelegate {

    @IBOutlet private var feedbackBanner: MVFeedbackBanner!
    
    var bottomFeedbackBanner: MVFeedbackBanner!

    var feedbackBannerController: MVFeedbackBannerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showTopBanner()
        
        guard let ncView = self.navigationController?.view else {
            return
        }
        
        let (banner, configurator) = MVFeedbackBannerConfigurator.createBanner(parentView: ncView, delegate: self)
        
        bottomFeedbackBanner = banner
        
        feedbackBannerController = configurator
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
        
        UIView.animate(withDuration: 0.3) {
            self.bottomFeedbackBanner.alpha = 0.0
        }
    }
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        
        feedbackBannerController.reset()
        UIView.animate(withDuration: 0.3) {
            self.bottomFeedbackBanner.alpha = 1.0
        }
    }

}

