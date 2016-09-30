//
//  ViewController.swift
//  MVFeedbackBannerFlowDemo
//
//  Created by Andrea Bizzotto on 28/09/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit
import MVFeedbackBannerFlow


class ViewController: UIViewController {

    @IBOutlet private var feedbackBanner: MVFeedbackBanner!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let banner = MVFeedbackBanner()
        
        print("subview: \(banner.subviews)")
        
        feedbackBanner.title = "Yo there, are you enjoying this amazing app?"
        feedbackBanner.negativeText = "Not really"
        feedbackBanner.positiveText = "Yeah!"
        
    }
}

