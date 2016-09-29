//
//  FeedbackBanner.swift
//  MVFeedbackBannerFlow
//
//  Created by Andrea Bizzotto on 28/09/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

public class FeedbackBanner: UIView {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var negativeButton: RoundedButton!
    @IBOutlet var positiveButton: RoundedButton!
    
    override public func awakeFromNib() {
        negativeButton.buttonStyle = .border
        positiveButton.buttonStyle = .fill
    }
 
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let bundle = Bundle(for: FeedbackBanner.self)
        
        if let view = bundle.loadNibNamed("FeedbackBanner", owner: self, options: nil)?.first as? UIView {
            
            self.addSubview(view)
            
            view.anchorToSuperview()
        }
    }
    
    public var title: String = NSLocalizedString("BannerTitle", comment: "") {
        didSet {
            titleLabel.text = title
        }
    }
    public var negativeText: String = NSLocalizedString("BannerNegativeText", comment: "") {
        didSet {
            negativeButton.setTitle(negativeText, for: .normal)
        }
    }
    public var positiveText: String = NSLocalizedString("BannerPositiveText", comment: "") {
        didSet {
            positiveButton.setTitle(positiveText, for: .normal)
        }
    }
}
