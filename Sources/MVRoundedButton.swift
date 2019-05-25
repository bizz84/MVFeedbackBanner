//
//  RoundedButton.swift
//  MVFeedbackBanner
//
//  Created by Andrea Bizzotto on 28/09/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

public enum MVRoundedButtonStyle: Int {
    case fill
    case border
}

@IBDesignable
public class MVRoundedButton: UIButton {
    
  public var buttonStyle: MVRoundedButtonStyle = .border {
        didSet {
            switch buttonStyle {
            case .border:
                self.layer.borderWidth = 2.0
                self.layer.borderColor = UIColor.white.cgColor
                self.backgroundColor = UIColor.clear
                self.setTitleColor(UIColor.white, for: .normal)
            case .fill:
                self.layer.borderWidth = 0.0
                self.layer.borderColor = UIColor.clear.cgColor
                self.backgroundColor = UIColor.white
                self.setTitleColor(UIColor(red: 20.0/255.0, green: 160.0/255.0, blue: 1.0, alpha: 1.0), for: .normal)
            }
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = cornerRadius
        }
        get {
            return self.layer.cornerRadius
        }
    }
}
