//
//  MVFeedbackBannerController.swift
//  MVFeedbackBannerFlow
//
//  Created by Andrea Bizzotto on 01/10/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

public struct MVFeedbackBannerAttributes {
    let title: String
    let negativeText: String
    let positiveText: String
    let backgroundColor: UIColor
    public init(title: String, negativeText: String, positiveText: String, backgroundColor: UIColor) {
        self.title = title
        self.negativeText = negativeText
        self.positiveText = positiveText
        self.backgroundColor = backgroundColor
    }
}

public enum MVFeedbackBannerExitStatus {
    case negativeDismiss
    case negativeAction
    case positiveDismiss
    case positiveAction
}

public protocol MVFeedbackBannerControllerDelegate: class {
    func feedbackBannerRequestedExit(status: MVFeedbackBannerExitStatus)
}

@objc public class MVFeedbackBannerController: NSObject {

    private enum MVFeedbackBannerState {
        case initial
        case chosenNegative
        case chosenPositive
    }
    private var state: MVFeedbackBannerState

    private let feedbackBanner: MVFeedbackBanner
    
    private unowned let delegate: MVFeedbackBannerControllerDelegate
    
    private let initialAttributes: MVFeedbackBannerAttributes
    private let negativeAttributes: MVFeedbackBannerAttributes
    private let positiveAttributes: MVFeedbackBannerAttributes
    
    public init(feedbackBanner: MVFeedbackBanner,
                delegate: MVFeedbackBannerControllerDelegate,
                initialAttributes: MVFeedbackBannerAttributes,
                negativeAttributes: MVFeedbackBannerAttributes,
                positiveAttributes: MVFeedbackBannerAttributes) {
        
        self.feedbackBanner = feedbackBanner
        self.delegate = delegate
        self.initialAttributes = initialAttributes
        self.negativeAttributes = negativeAttributes
        self.positiveAttributes = positiveAttributes
        
        self.state = .initial
        super.init()
        updateBanner(attributes: initialAttributes, animated: false)
        
        feedbackBanner.negativeButton.addTarget(self, action: #selector(negativeButtonPressed), for: .touchUpInside)
        feedbackBanner.positiveButton.addTarget(self, action: #selector(positiveButtonPressed), for: .touchUpInside)
    }
    
    public func reset() {
        self.state = .initial
        updateBanner(attributes: initialAttributes, animated: false)
    }
    
    // MARK: Private
    private func updateBanner(attributes: MVFeedbackBannerAttributes, animated: Bool) {
        feedbackBanner.title = attributes.title
        feedbackBanner.negativeText = attributes.negativeText
        feedbackBanner.positiveText = attributes.positiveText
        if animated && feedbackBanner.backgroundColor != attributes.backgroundColor {
            UIView.animate(withDuration: 0.3) {
                self.feedbackBanner.backgroundColor = attributes.backgroundColor
            }
        }
        else {
            feedbackBanner.backgroundColor = attributes.backgroundColor
        }
    }
    
    @objc private func negativeButtonPressed() {
        switch state {
        case .initial:
            state = .chosenNegative
            self.updateBanner(attributes: self.negativeAttributes, animated: true)
        case .chosenNegative:
            delegate.feedbackBannerRequestedExit(status: .negativeDismiss)
        case .chosenPositive:
            delegate.feedbackBannerRequestedExit(status: .negativeAction)
        }
    }
    @objc private func positiveButtonPressed() {
        switch state {
        case .initial:
            state = .chosenPositive
            self.updateBanner(attributes: self.positiveAttributes, animated: true)
        case .chosenNegative:
            delegate.feedbackBannerRequestedExit(status: .positiveDismiss)
        case .chosenPositive:
            delegate.feedbackBannerRequestedExit(status: .positiveAction)
        }
    }
}
