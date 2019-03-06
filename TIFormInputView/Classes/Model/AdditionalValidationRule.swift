//
//  AdditionalValidationRule.swift
//  TIFormInputView
//
//  Created by Tomasz Iwaszek on 2/20/19.
//  Copyright © 2019 wachus77. All rights reserved.
//

import UIKit

open class AdditionalValidationRule {
    public var regex: String {
        didSet {
            refreshAdditionalRulesDelegate?.refreshAdditionalRules()
        }
    }
    public var text: String {
        didSet {
            refreshAdditionalRulesDelegate?.refreshAdditionalRules()
        }
    }
    public var textColor: UIColor {
        didSet {
            refreshAdditionalRulesDelegate?.refreshAdditionalRules()
        }
    }
    public var textFont: UIFont {
        didSet {
            refreshAdditionalRulesDelegate?.refreshAdditionalRules()
        }
    }
    public var selectedStateImage: UIImage {
        didSet {
            refreshAdditionalRulesDelegate?.refreshAdditionalRules()
        }
    }
    public var unselectedStateImage: UIImage {
        didSet {
            refreshAdditionalRulesDelegate?.refreshAdditionalRules()
        }
    }
    public var imageWidth: CGFloat {
        didSet {
            refreshAdditionalRulesDelegate?.refreshAdditionalRules()
        }
    }
    
    weak var refreshAdditionalRulesDelegate: RefreshAdditionalRulesDelegate?
    
    public init(regex: String, text: String) {
        self.regex = regex
        self.text = text
        self.textFont = UIFont.systemFont(ofSize: 14)
        self.textColor = UIColor.white
        self.selectedStateImage = UIImage(named: "selected.png", in: Bundle.resourseBundle, compatibleWith: nil)!
        self.unselectedStateImage = UIImage(named: "unselected.png", in: Bundle.resourseBundle, compatibleWith: nil)!
        self.imageWidth = 14
    }
    
    public init(regex: String, text: String, textColor: UIColor, textFont: UIFont, selectedStateImage: UIImage, unselectedStateImage: UIImage, imageWidth: CGFloat) {
        self.regex = regex
        self.text = text
        self.textFont = textFont
        self.textColor = textColor
        self.selectedStateImage = selectedStateImage
        self.unselectedStateImage = unselectedStateImage
        self.imageWidth = imageWidth
    }
}



