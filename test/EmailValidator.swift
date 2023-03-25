//
//  EmailValidator.swift
//  test
//
//  Created by  Максим Мартынов on 14.03.2023.
//

import Foundation
import UIKit


//MARK: - Email Validation
let firstPart: String = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
let serverPart: String = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
let emailRegex: String = firstPart + "@" + serverPart + "[A-Za-z]{2,8}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)

    extension String {
        func isEmail() -> Bool {
            return emailPredicate.evaluate(with: self)
        }
    }

    extension UITextField {
        func isEmail() -> Bool {
            return self.text?.isEmail() ?? false
        }
    }
