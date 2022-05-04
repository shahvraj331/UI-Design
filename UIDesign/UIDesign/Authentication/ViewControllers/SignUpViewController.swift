//
//  SignUpViewController.swift
//  UIDesign
//
//  Created by Vraj Shah on 03/05/22.
//

import UIKit

class SignUpViewController: UIViewController, Storyboarded {

    //MARK: - Variables
    var coordinator: BaseCoordinator?
    
    //MARK: - Outlets
    @IBOutlet weak var btnRememberMe: UIButton!
    @IBOutlet weak var txtFullName: UITextField!
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
        coordinator?.finish()
    }
    
    @IBAction func signInAction(_ sender: BaseButton) {
        coordinator?.startProfileScreen()
    }
    
    //MARK: - File private functions
    fileprivate func initViewController() {
        view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        btnRememberMe.layer.cornerRadius = 5.0
        btnRememberMe.layer.masksToBounds = true
    }
    
}//End of class

//MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtFullName {
            txtEmail.becomeFirstResponder()
        } else if textField == txtEmail {
            txtPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}//End of extension
