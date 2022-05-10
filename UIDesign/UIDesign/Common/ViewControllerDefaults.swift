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
    
}//End of extension
