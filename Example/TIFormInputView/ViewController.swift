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

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var email: FormInputView!
    @IBOutlet weak var password: FormInputView!
    
    var additionalRules: [AdditionalValidationRule] = []
    
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
        email.errorColor = UIColor(hexString: "#a12428")
        
        let addtRulMin8CharRegex = "^.*(?=.{8,}).*$"
        let addtRulUpperLowerCaseRegex = "^.*(?=.*[A-Z])(?=.*[a-z]).*$"
        let addtRulOneNumeralRegex = "^.*(?=.*[0-9]).*$"
        
        let addtRulMin8CharText = "min 8 characters"
        let addtRulUpperLowerCaseText = "at least one upper case and one lower case"
        let addtRulOneNumeralText = "at least one numeral"
        
        additionalRules = [AdditionalValidationRule(regex: addtRulMin8CharRegex, text: addtRulMin8CharText), AdditionalValidationRule(regex: addtRulUpperLowerCaseRegex, text: addtRulUpperLowerCaseText), AdditionalValidationRule(regex: addtRulOneNumeralRegex, text: addtRulOneNumeralText)]
        
        let passwordRegex = "^.*(?=.{8,})(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).*$"
        let passwordPlaceholder = "password"
        let passwordErrorText = "please provide valid password"
        
        password.isSecuredTextEntry = true
        password.placeholder = passwordPlaceholder
        password.regex = passwordRegex
        password.error = passwordErrorText
        password.errorColor = UIColor(hexString: "#a12428")
        //password.initAdditionalValidationRules(additionalRules: additionalRules)
        password.additionalRules = additionalRules
    }
    
    @IBAction func editAdditionalRules(_ sender: Any) {
        additionalRules[0].text = "the text of the edited rule"
        //additionalRules.removeLast()
        //password.setAdditionalValidationRules(additionalRules: additionalRules)
        password.additionalRules[1].text = "the text of the edited rule 1"
    }
    
    @IBAction func editEmailField(_ sender: Any) {
        email.textFont = UIFont.systemFont(ofSize: 25)
    }
    
}
