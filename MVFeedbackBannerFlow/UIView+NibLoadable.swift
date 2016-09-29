//
//  UIView+NibLoadable.swift
//  MVFeedbackBannerFlow
//
//  Created by Andrea Bizzotto on 29/09/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

protocol NibLoadable {
    func loadFromNib()
}

extension NibLoadable where Self: UIView {
    
    func loadFromNib() {
        
        let bundle = Bundle(for: Self.self)
        
        let nibName = "\(Self.self)"
        
        if let view = bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView {
            
            self.addSubview(view)
            
            view.anchorToSuperview()
        }
    }
}
