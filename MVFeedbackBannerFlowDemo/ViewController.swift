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

    @IBOutlet private var feedbackBanner: FeedbackBanner!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let banner = FeedbackBanner(frame: .zero)
        
        print("subview: \(banner.subviews)")
        
//        if let banner = FeedbackBanner.createFromNib() as? FeedbackBanner {
//            if let nc = self.navigationController {
//                nc.view.addSubview(banner)
//                
//                let constraints = [
//                    banner.makeEqualityConstraint(attribute: .left, toView: nc.view),
//                    banner.makeEqualityConstraint(attribute: .right, toView: nc.view),
//                    banner.makeEqualityConstraint(attribute: .top, toView: nc.view)
//                ]
//                nc.view.addConstraints(constraints)
//                
//            }
//        }
        
        feedbackBanner.title = "Yo there, are you enjoying this amazing app?"
        feedbackBanner.negativeText = "Not really"
        feedbackBanner.positiveText = "Yeah!"
        
        //feedbackBanner.isHidden = true
    }

}

