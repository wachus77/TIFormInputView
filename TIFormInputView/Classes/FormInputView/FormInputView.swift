//
//  FormInputView.swift
//  TIFormInputView
//
//  Created by Tomasz Iwaszek on 2/19/19.
//  Copyright © 2019 wachus77. All rights reserved.
//

import UIKit

typealias CompletionHandler = (() -> Void)?

protocol InputViewDelegate: class {
    func additionalStepByStepValidationResult(rule: AdditionalValidationRule, result: Bool)
    func inputViewTextFieldDidEndEditing(_ view: FormInputView) -> ()
    func inputViewTextFieldDidChange(_ view: FormInputView) -> ()
}

protocol RefreshAdditionalRulesDelegate: class {
    func refreshAdditionalRules()
}

@IBDesignable
open class FormInputView: UIView, XibSetup {
    
    // MARK: - Outlets
    
    @IBOutlet weak var inputTextTitle: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var stackContainer: UIView!
    
    // MARK: - Public properties
    
    weak var delegate: InputViewDelegate?
    
    var view: UIView!
    
    public var regex: String?
    
    public var isEmpty: Bool {
        guard let text = inputTextField.text else { return true }
        return text.isEmpty
    }
    
    public var inputIsValid: Bool {
        if regex != nil {
            return validateTextRegEx()
        } else {
            return !isEmpty
        }
    }
    
    public var isSecuredTextEntry: Bool = false {
        didSet {
            inputTextField.isSecureTextEntry = isSecuredTextEntry
        }
    }
    
    public var keyboardType: UIKeyboardType = .default {
        didSet {
            inputTextField.keyboardType = keyboardType
        }
    }
    
    // MARK: - texts
    
    public var placeholder: String = "default" {
        didSet {
            inputTextField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                                      attributes: [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font: textFont])
            
            inputTextTitle.text = placeholder
        }
    }
    
    public var error: String? {
        didSet {
            errorLabel.text = error
        }
    }
    
    public var text: String? {
        get {
            return inputTextField.text
        }
        set {
            inputTextField.text = newValue
        }
    }
    
    // MARK: - colors
    
    public var textColor: UIColor = .white {
        didSet {
            inputTextField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                                      attributes: [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font: textFont])
            inputTextField.textColor = textColor
            inputTextTitle.textColor = textColor
        }
    }
    
    public var textFont: UIFont = UIFont.systemFont(ofSize: 17) {
        didSet {
            inputTextField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                                      attributes: [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font: textFont])
            inputTextField.font = textFont
        }
    }
    
    public var errorColor: UIColor = .red {
        didSet {
            errorLabel.textColor = errorColor
        }
    }
    
    public var errorFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            errorLabel.font = errorFont
        }
    }
    
    public var titleFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            inputTextTitle.font = titleFont
        }
    }
    
    public var separatorColor: UIColor = .white {
        didSet {
            separator.backgroundColor = separatorColor
        }
    }
    
    public var additionalRules: [AdditionalValidationRule] = [] {
        didSet {
            refreshAdditionalRules()
        }
    }
    
    // MARK: - Private properties
    
    private var additionalRuleViews: [AdditionalRuleView] = []
    private var stackView: UIStackView?
    
    // MARK: - Init
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    // MARK: - Prepare interface builder
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        view?.prepareForInterfaceBuilder()
    }
    
    // MARK: - Configuration functions
    
    private func configureView() {
        xibSetup()
        inputTextField.delegate = self
        inputTextTitle.isHidden = true
        errorLabel.isHidden = true
        inputTextField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                                  attributes: [NSAttributedString.Key.foregroundColor: textColor])
        inputTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    public func initAdditionalValidationRules(additionalRules: [AdditionalValidationRule]) {
        if !additionalRules.isEmpty && additionalRuleViews.isEmpty {
            self.additionalRules = additionalRules
        }
    }
    
    public func setAdditionalValidationRules(additionalRules: [AdditionalValidationRule]) {
        if !additionalRules.isEmpty {
            self.additionalRules = additionalRules
        }
    }
    
    public func removeAdditionalValidationRules() {
        guard let stackView = stackView else { return }
        additionalRuleViews = []
        stackView.removeFromSuperview()
    }
    
    private func showHideError(show: Bool) {
        errorLabel.isHidden = !show
        separator.backgroundColor = show ? errorColor : separatorColor
    }
    
    //MARK: - Validation
    
    private func validateTextRegEx() -> Bool {
        guard let text = text, let regex = regex else { return false }
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
    private func validateAdditionalStepByStepRegex(rule: AdditionalValidationRule) -> Bool {
        guard let text = text else { return false }
        return NSPredicate(format: "SELF MATCHES %@", rule.regex).evaluate(with: text)
    }
    
    private func validateAdditionalStepByStep() {
        if !additionalRuleViews.isEmpty {
            for view in additionalRuleViews {
                let result = validateAdditionalStepByStepRegex(rule: view.rule)
                view.ruleValButton.isSelected = result
                delegate?.additionalStepByStepValidationResult(rule: view.rule, result: result)
            }
        }
    }
    
    func validate(silent: Bool, hideError: Bool = false) -> Bool {
        let result = inputIsValid
        if silent == false {
            showHideError(show: !result)
        }
        
        if result && hideError {
            showHideError(show: false)
        }
        return result
    }
    
}

// MARK: - TextField delegate

extension FormInputView: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        _ = validate(silent: false)
        delegate?.inputViewTextFieldDidEndEditing(self)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        _ = validate(silent: true, hideError: true)
        validateAdditionalStepByStep()
        inputTextTitle.isHidden = isEmpty
        delegate?.inputViewTextFieldDidChange(self)
    }
    
}

// MARK: - RefreshAdditionalRulesDelegate delegate

extension FormInputView: RefreshAdditionalRulesDelegate {
    func refreshAdditionalRules() {
        removeAdditionalValidationRules()
        for rule in additionalRules {
            let view = AdditionalRuleView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            view.rule = rule
            rule.refreshAdditionalRulesDelegate = self
            additionalRuleViews.append(view)
        }
        stackView = UIStackView(arrangedSubviews: additionalRuleViews)
        guard let stackView = stackView else { return }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackContainer.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: stackContainer.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: stackContainer.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: stackContainer.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: stackContainer.trailingAnchor).isActive = true
    }
}


