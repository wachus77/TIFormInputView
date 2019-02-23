//
//  UIView+Extension.swift
//  TIFormInputView
//
//  Created by Tomasz Iwaszek on 2/19/19.
//  Copyright © 2019 wachus77. All rights reserved.
//

import UIKit

extension UIView {
    
    func loadNib() -> UIView {
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: Bundle.resourseBundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
}

