
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

        bottomFeedbackBanner = MVFeedbackBanner()

        bannerController = createBannerController(banner: bottomFeedbackBanner, delegate: self)

        bannerPresenter = MVFeedbackBannerPresenterSlideFromBottom(parentView: navigationControllerView, banner: bottomFeedbackBanner)
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

    func createBannerController(banner: MVFeedbackBanner, delegate: MVFeedbackBannerControllerDelegate) -> MVFeedbackBannerController {
        
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

