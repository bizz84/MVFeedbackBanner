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
        
        let nibName = (String(describing: type(of: self)) as NSString).components(separatedBy: ".").last!
                
        if let view = bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView {
            
            self.addSubview(view)
            
            view.anchorToSuperview()
        }
    }
}

open class UIViewNibLoadable: UIView, NibLoadable {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadFromNib()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadFromNib()
    }
}
