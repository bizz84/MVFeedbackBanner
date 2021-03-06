
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

    // Top banner
    @IBOutlet var topFeedbackBanner: MVFeedbackBanner!
    
    var topBannerController: MVFeedbackBannerController!
    
    var topBannerPresenter: MVFeedbackBannerPresenter!
    
    @IBOutlet var topSwitch: UISwitch!
    
    @IBOutlet var topOutputLabel: UILabel!
    
    // Bottom banner
    var bottomFeedbackBanner: MVFeedbackBanner!

    var bottomBannerController: MVFeedbackBannerController!
    
    var bottomBannerPresenter: MVFeedbackBannerPresenter!

    @IBOutlet var bottomSwitch: UISwitch!

    @IBOutlet var bottomOutputLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Top
        topBannerController = createBannerController(banner: topFeedbackBanner, delegate: self)
        
        topBannerPresenter = MVFeedbackBannerPresenterFadeIn(parentView: self.view, banner: topFeedbackBanner)
        
        topOutputLabel.text = "Last action: none"
        
        // Bottom
        bottomFeedbackBanner = MVFeedbackBanner()

        bottomBannerController = createBannerController(banner: bottomFeedbackBanner, delegate: self)

        bottomBannerPresenter = MVFeedbackBannerPresenterSlideFromBottom(parentView: self.view, banner: bottomFeedbackBanner)
        
        bottomOutputLabel.text = "Last action: none"
    }
    
    
    // MVFeedbackBannerControllerDelegate
    func feedbackBanner(_ banner: MVFeedbackBanner, requestedExitWithStatus status: MVFeedbackBannerExitStatus) {

        let exitString = stringForExit(status: status)

        if banner == topFeedbackBanner {
            topOutputLabel.text = "Last action: \(exitString)"
            topSwitch.isOn = false
            topBannerPresenter.setBannerHidden(true, animated: true)
        }
        else {
            bottomOutputLabel.text = "Last action: \(exitString)"
            bottomSwitch.isOn = false
            bottomBannerPresenter.setBannerHidden(true, animated: true)
        }
    }
    
    func stringForExit(status: MVFeedbackBannerExitStatus) -> String {
        
        switch status {
        case .negativeDismiss: return "Dismiss"
        case .negativeAction: return "Show Feedback Form"
        case .positiveDismiss: return "Dismiss"
        case .positiveAction: return "Rate on App Store"
        }
    }
    
    @IBAction func topSwitchValueChanged(sender: UISwitch) {
        
        let hidden = !sender.isOn
        topBannerPresenter.setBannerHidden(hidden, animated: true)
        if !hidden {
            topBannerController.reset()
        }
    }

    @IBAction func bottomSwitchValueChanged(sender: UISwitch) {
        
        let hidden = !sender.isOn
        bottomBannerPresenter.setBannerHidden(hidden, animated: true)
        if !hidden {
            bottomBannerController.reset()
        }
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

