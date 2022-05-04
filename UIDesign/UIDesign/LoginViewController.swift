//
//  ViewController.swift
//  UIDesign
//
//  Created by Vraj Shah on 28/04/22.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {

    //MARK: - Variables
    var coordinator: BaseCoordinator?
    
    //MARK: - Outlets
    @IBOutlet weak var btnRememberMe: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    //MARK: - UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }

    //MARK: - Actions
    @IBAction func rememberMeAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        coordinator?.startSignUpScreen()
    }
    
    @IBAction func someAction(_ sender: UIButton) {
        //TODO: - Login validation
    }
    
    //MARK: - File private functions
    fileprivate func initViewController() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        btnRememberMe.layer.cornerRadius = 5.0
        btnRememberMe.layer.masksToBounds = true
    }
    
}//End of class

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtEmail {
            txtPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}//End of extension
