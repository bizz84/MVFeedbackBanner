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
 
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let bundle = Bundle(for: FeedbackBanner.self)
        
        if let view = bundle.loadNibNamed("FeedbackBanner", owner: self, options: nil)?.first as? UIView {
            
            self.addSubview(view)
            
            view.topAnchor = self.topAnchor
            view.leftAnchor = self.leftAnchor
            view.rightAnchor = self.rightAnchor
            view.bottomAnchor = self.bottomAnchor
        }
    }
    
}
