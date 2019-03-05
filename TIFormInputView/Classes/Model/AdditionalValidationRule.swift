//
//  AdditionalValidationRule.swift
//  TIFormInputView
//
//  Created by Tomasz Iwaszek on 2/20/19.
//  Copyright © 2019 wachus77. All rights reserved.
//

import UIKit

open class AdditionalValidationRule {
    public var regex: String
    public var text: String
    public var textColor: UIColor
    public var textFont: UIFont
    public var selectedStateImage: UIImage
    public var unselectedStateImage: UIImage
    public var imageWidth: CGFloat
    
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

