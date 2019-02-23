//
//  ViewController.swift
//  TIFormInputView
//
//  Created by tomek.iwaszek on 02/22/2019.
//  Copyright (c) 2019 tomek.iwaszek. All rights reserved.
//

import UIKit
import TIFormInputView

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var email: FormInputView!
    @IBOutlet weak var password: FormInputView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPlaceholder = "email"
        let emailErrorText = "please provide valid email"
        
        email.keyboardType = .emailAddress
        email.placeholder = emailPlaceholder
        email.regex = emailRegex
        email.error = emailErrorText
        
        let addtRulMin8CharRegex = "^.*(?=.{8,}).*$"
        let addtRulUpperLowerCaseRegex = "^.*(?=.*[A-Z])(?=.*[a-z]).*$"
        let addtRulOneNumeralRegex = "^.*(?=.*[0-9]).*$"
        
        let addtRulMin8CharText = "min 8 characters"
        let addtRulUpperLowerCaseText = "at least one upper case and one lower case"
        let addtRulOneNumeralText = "at least one numeral"
        
        let additionalRules = [AdditionalValidationRule(regex: addtRulMin8CharRegex, text: addtRulMin8CharText), AdditionalValidationRule(regex: addtRulUpperLowerCaseRegex, text: addtRulUpperLowerCaseText), AdditionalValidationRule(regex: addtRulOneNumeralRegex, text: addtRulOneNumeralText)]
        
        let passwordRegex = "^.*(?=.{8,})(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).*$"
        let passwordPlaceholder = "password"
        let passwordErrorText = "please provide valid password"
        
        password.isSecuredTextEntry = true
        password.placeholder = passwordPlaceholder
        password.regex = passwordRegex
        password.error = passwordErrorText
        password.initAdditionalValidationRules(additionalRules: additionalRules)
    }
    
}
