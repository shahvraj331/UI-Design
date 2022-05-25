//
//  BaseTextField.swift
//  UIDesign
//
//  Created by Vraj Shah on 26/05/22.
//

import UIKit

extension UITextField {
    
    func trimmedtext() -> String? {
        guard let text = self.text else {
            return nil
        }
        return text.trimmingCharacters(in: .whitespaces)
    }
    
    func verifyEmail() -> Bool {
        if let text = self.trimmedtext() {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: text)
        }
        return false
    }
    
}//End of extension
