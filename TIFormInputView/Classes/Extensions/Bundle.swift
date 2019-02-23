//
//  Bundle.swift
//  TIFormInputView
//
//  Created by Tomasz Iwaszek on 2/22/19.
//

import Foundation

extension Bundle {
    static var resourseBundle: Bundle {
        let frameworkBundle = Bundle(for: FormInputView.self)
        return frameworkBundle
    }
}
