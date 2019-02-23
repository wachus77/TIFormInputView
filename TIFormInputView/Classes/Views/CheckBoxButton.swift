//
//  CheckBoxButton.swift
//  TIFormInputView
//
//  Created by Tomasz Iwaszek on 2/19/19.
//  Copyright © 2019 wachus77. All rights reserved.
//

import UIKit

class CheckBoxButton: UIButton {
    
    var rule: AdditionalValidationRule!
    
    override var isSelected: Bool {
        didSet {
            customizeButton()
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.customizeButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeButton()
    }
    
    private func customizeButton() {
        self.setSelected()
    }
    
    private func setSelected() {
        guard let rule = rule else {
            return
        }
        
        if isSelected {
            self.setBackgroundImage(rule.selectedStateImage, for: .selected)
        } else {
            self.setBackgroundImage(rule.unselectedStateImage, for: .normal)
        }
    }
}
