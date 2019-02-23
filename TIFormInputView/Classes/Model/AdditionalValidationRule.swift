//
//  AdditionalValidationRule.swift
//  TIFormInputView
//
//  Created by Tomasz Iwaszek on 2/20/19.
//  Copyright © 2019 wachus77. All rights reserved.
//

import UIKit

open class AdditionalValidationRule {
    var regex: String
    var text: String
    var selectedStateImage: UIImage
    var unselectedStateImage: UIImage
    
    public init(regex: String, text: String) {
        self.regex = regex
        self.text = text
        self.selectedStateImage = UIImage(named: "selected.png", in: Bundle.resourseBundle, compatibleWith: nil)!
        self.unselectedStateImage = UIImage(named: "unselected.png", in: Bundle.resourseBundle, compatibleWith: nil)!
    }
    
    public init(regex: String, text: String, selectedStateImage: UIImage, unselectedStateImage: UIImage) {
        self.regex = regex
        self.text = text
        self.selectedStateImage = selectedStateImage
        self.unselectedStateImage = unselectedStateImage
    }
}

