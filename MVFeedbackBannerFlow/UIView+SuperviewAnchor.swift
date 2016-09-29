//
//  UIView+SuperviewAnchor.swift
//  MVFeedbackBannerFlow
//
//  Created by Andrea Bizzotto on 29/09/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchorToSuperview() {
        
        if let superview = self.superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            
            superview.addConstraints([
                makeEqualityConstraint(attribute: .left, toView: superview),
                makeEqualityConstraint(attribute: .top, toView: superview),
                makeEqualityConstraint(attribute: .right, toView: superview),
                makeEqualityConstraint(attribute: .bottom, toView: superview)
                ])
        }
    }
    func makeEqualityConstraint(attribute: NSLayoutAttribute, toView view: UIView) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .equal,
                                  toItem: view, attribute: attribute, multiplier: 1, constant: 0)
    }
}
