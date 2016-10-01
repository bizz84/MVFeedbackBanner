//
//  MVFeedbackBannerController.swift
//  MVFeedbackBannerFlow
//
//  Created by Andrea Bizzotto on 01/10/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

public struct MVFeedbackBannerModel {
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

    public enum MVFeedbackBannerState {
        case initial
        case chosenNegative
        case chosenPositive
    }
    public var state: MVFeedbackBannerState

    private let feedbackBanner: MVFeedbackBanner
    
    unowned let delegate: MVFeedbackBannerControllerDelegate
    
    private let initialModel: MVFeedbackBannerModel
    private let negativeModel: MVFeedbackBannerModel
    private let positiveModel: MVFeedbackBannerModel
    
    public init(feedbackBanner: MVFeedbackBanner,
                delegate: MVFeedbackBannerControllerDelegate,
                initialModel: MVFeedbackBannerModel,
                negativeModel: MVFeedbackBannerModel,
                positiveModel: MVFeedbackBannerModel) {
        
        self.feedbackBanner = feedbackBanner
        self.delegate = delegate
        self.initialModel = initialModel
        self.negativeModel = negativeModel
        self.positiveModel = positiveModel
        
        self.state = .initial
        super.init()
        updateBanner(model: initialModel, animated: false)
        
        feedbackBanner.negativeButton.addTarget(self, action: #selector(negativeButtonPressed), for: .touchUpInside)
        feedbackBanner.positiveButton.addTarget(self, action: #selector(positiveButtonPressed), for: .touchUpInside)
    }
    
    public func reset() {
        self.state = .initial
        updateBanner(model: initialModel, animated: false)
    }
    
    private func updateBanner(model: MVFeedbackBannerModel, animated: Bool) {
        feedbackBanner.title = model.title
        feedbackBanner.negativeText = model.negativeText
        feedbackBanner.positiveText = model.positiveText
        if animated && feedbackBanner.backgroundColor != model.backgroundColor {
            UIView.animate(withDuration: 0.3) {
                self.feedbackBanner.backgroundColor = model.backgroundColor
            }
        }
        else {
            feedbackBanner.backgroundColor = model.backgroundColor
        }
    }
    
    @objc private func negativeButtonPressed() {
        switch state {
        case .initial:
            state = .chosenNegative
            self.updateBanner(model: self.negativeModel, animated: true)
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
            self.updateBanner(model: self.positiveModel, animated: true)
        case .chosenNegative:
            delegate.feedbackBannerRequestedExit(status: .positiveDismiss)
        case .chosenPositive:
            delegate.feedbackBannerRequestedExit(status: .positiveAction)
        }
    }
}
