//
//  FeedbackBanner.swift
//  MVFeedbackBanner
//
//  Created by Andrea Bizzotto on 28/09/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

@IBDesignable public class MVFeedbackBanner: UIViewNibLoadable {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var negativeButton: MVRoundedButton!
    @IBOutlet var positiveButton: MVRoundedButton!
    
    override public func awakeFromNib() {
        negativeButton.buttonStyle = .border
        positiveButton.buttonStyle = .fill
    }
    
    public override var backgroundColor: UIColor? {
        didSet {
            self.subviews.first?.backgroundColor = backgroundColor
            positiveButton?.setTitleColor(backgroundColor, for: .normal)
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

