//
//  XibSetup.swift
//  TIFormInputView
//
//  Created by Tomasz Iwaszek on 2/19/19.
//  Copyright © 2019 wachus77. All rights reserved.
//

import UIKit

protocol XibSetup: class {
    var view: UIView! { get set }
    func xibSetup()
}

extension XibSetup where Self: UIView {
    func xibSetup() {
        view = self.loadNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(view)
    }
}
