//
//  FeedbackBanner.swift
//  MVFeedbackBannerFlow
//
//  Created by Andrea Bizzotto on 28/09/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

class FeedbackBanner: UIView {

    @IBOutlet var negativeButton: RoundedButton!
    @IBOutlet var positiveButton: RoundedButton!
    
    override func awakeFromNib() {
        negativeButton.buttonStyle = .border
        positiveButton.buttonStyle = .fill
    }
   
}
