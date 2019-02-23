# TIFormInputView

[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/wachus77/TIFormInputView/master/LICENSE)
[![Swift 4.2](https://img.shields.io/badge/Swift-4.2-green.svg?style=flat)](https://developer.apple.com/swift/)

![Animation](https://raw.githubusercontent.com/wachus77/TIFormInputView/master/Screenshots/forminputview.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

TIFormInputView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TIFormInputView'
```

## Basic Usage

```swift
import TIFormInputView
```
Make an outlet or create a view programmatically and configure it.

```swift

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
```

## Author

Tomasz Iwaszek, wachus77@gmail.com

## License

TIFormInputView is available under the MIT license. See the LICENSE file for more info.
