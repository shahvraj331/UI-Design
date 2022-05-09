//
//  ViewController.swift
//  UIDesign
//
//  Created by Vraj Shah on 28/04/22.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var btnRememberMe: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: BaseButton!
    
    //MARK: - UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }

    //MARK: - Actions
    @IBAction func rememberMeAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    //MARK: - File private functions
    fileprivate func initViewController() {
        view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        btnRememberMe.layer.cornerRadius = 5.0
        btnRememberMe.layer.masksToBounds = true
    }
    
}//End of class

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtEmail {
            textField.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}//End of extension
