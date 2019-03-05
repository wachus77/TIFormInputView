//
//  AdditionalRuleView.swift
//  TIFormInputView
//
//  Created by Tomasz Iwaszek on 2/20/19.
//  Copyright © 2019 wachus77. All rights reserved.
//

import UIKit

class AdditionalRuleView: UIView, XibSetup {
    
    // MARK: - Outlets
    
    @IBOutlet weak var ruleValButton: CheckBoxButton!
    @IBOutlet weak var ruleLabel: UILabel!
    
    // MARK: - Public properties
    
    var view: UIView!
    
    var rule: AdditionalValidationRule! {
        didSet {
            setInputViewType()
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    // MARK: - Configuration functions
    
    private func configureView() {
        xibSetup()
    }
    
    private func setInputViewType() {
        ruleLabel.text = rule.text
        ruleLabel.textColor = rule.textColor
        ruleLabel.font = rule.textFont
        ruleValButton.rule = rule
    }
}

