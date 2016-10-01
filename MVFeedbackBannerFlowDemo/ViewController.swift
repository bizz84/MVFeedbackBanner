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
    
    var feedbackBannerController: MVFeedbackBannerController!
    
    var bottomFeedbackBanner: MVFeedbackBanner!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showTopBanner()
        
        guard let ncView = self.navigationController?.view else {
            return
        }
        bottomFeedbackBanner = createBottomBanner(attachTo: ncView)
        
        feedbackBannerController = createBannerController(banner: bottomFeedbackBanner)
    }
    
    func createBannerController(banner: MVFeedbackBanner) -> MVFeedbackBannerController {
        
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
                                          delegate: self,
                                          initialModel: initialModel,
                                          negativeModel: negativeModel,
                                          positiveModel: positiveModel)
    }
    
    func showTopBanner() {
        
        feedbackBanner.title = "Interface builder banner"
        feedbackBanner.negativeText = "Not really"
        feedbackBanner.positiveText = "Yeah!"
    }
    
    func createBottomBanner(attachTo view: UIView) -> MVFeedbackBanner {
        
        let banner = MVFeedbackBanner()
        
        view.addSubview(banner)
        
        let constraints = [
            banner.leftAnchor.constraint(equalTo: view.leftAnchor),
            banner.rightAnchor.constraint(equalTo: view.rightAnchor),
            banner.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        view.addConstraints(constraints)

        return banner
    }
    
    func feedbackBannerRequestedExit(status: MVFeedbackBannerExitStatus) {
        switch status {
        case .negativeDismiss: break
        case .negativeAction: break
        case .positiveDismiss: break
        case .positiveAction: break
        }
        
        bottomFeedbackBanner.isHidden = true
    }
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        
        feedbackBannerController.reset()
        bottomFeedbackBanner.isHidden = false
    }

}

