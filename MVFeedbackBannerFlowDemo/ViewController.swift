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

        showTopBanner()
        
        if let ncView = self.navigationController?.view {
            showBottomBanner(attachTo: ncView)
        }
    }
    
    func showTopBanner() {
        
        feedbackBanner.title = "Interface builder banner"
        feedbackBanner.negativeText = "Not really"
        feedbackBanner.positiveText = "Yeah!"
    }
    
    func showBottomBanner(attachTo view: UIView) {
        
        let banner = MVFeedbackBanner()
        
        view.addSubview(banner)
        
        let constraints = [
            banner.leftAnchor.constraint(equalTo: view.leftAnchor),
            banner.rightAnchor.constraint(equalTo: view.rightAnchor),
            banner.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        view.addConstraints(constraints)

        banner.title = "Programmatic banner"
        banner.negativeText = "Not really"
        banner.positiveText = "Yeah!"
    }
}

