//
//  ViewControllerDefaults.swift
//  UIDesign
//
//  Created by Vraj Shah on 03/05/22.
//

import UIKit

extension UIViewController {
    
    func dismissKeyboardOnTap(_ view: UIView) {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func showDialog(_ message: String) {
        let alert = UIAlertController(title: R.string.localizable.alert(), message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: R.string.localizable.okay(), style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}//End of extension
