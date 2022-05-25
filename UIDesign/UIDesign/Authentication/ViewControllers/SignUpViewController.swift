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
    let viewModel = SignUpViewModel()
    
    //MARK: - Outlets
    @IBOutlet weak var btnRememberMe: UIButton!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var btnSignUp: BaseButton!
    
    //MARK: - UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad() 
        initViewController()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    //MARK: - Actions
    @IBAction func rememberMeAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        coordinator?.finish()
    }
    
    @IBAction func signInAction(_ sender: BaseButton) {
        validateInputs()
    }
    
    //MARK: - File private functions
    fileprivate func initViewController() {
        btnRememberMe.layer.cornerRadius = 5.0
        btnRememberMe.layer.masksToBounds = true
    }
    
    fileprivate func bindViewModel() {
        viewModel.signUpCallBack = { [weak self] responseData in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.updateBufferStatus(false)
                UserDefaults.standard.setUserLoggedIn(true)
                self.coordinator?.startProfileScreen()
            }
        }
        
        viewModel.errorCallBack = { [weak self] error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.updateBufferStatus(false)
                self.showDialog(error)
            }
        }
    }
    
    fileprivate func validateInputs() {
        guard let name = txtFullName.trimmedtext() else { return }
        guard let email = txtEmail.trimmedtext() else { return }
        guard let password = txtPassword.trimmedtext() else { return }
        switch true {
        case name.isEmpty:
            txtFullName.becomeFirstResponder()
            showDialog(R.string.localizable.name_required())
        case email.isEmpty:
            txtEmail.becomeFirstResponder()
            showDialog(R.string.localizable.email_required())
        case password.isEmpty:
            txtPassword.becomeFirstResponder()
            showDialog(R.string.localizable.password_required())
        case !txtEmail.verifyEmail():
            txtEmail.becomeFirstResponder()
            showDialog(R.string.localizable.email_not_valid())
        default:
            let userData = UserData(email: email, password: password)
            guard let data = try? JSONEncoder().encode(userData) else { return }
            viewModel.signUpUser(headers: defaultHeader, parameters: data)
            updateBufferStatus(true)
        }
    }
    
    fileprivate func updateBufferStatus(_ status: Bool) {
        if status {
            activityIndicator.startAnimating()
            btnSignUp.alpha = 0.0
        } else {
            activityIndicator.stopAnimating()
            btnSignUp.alpha = 100.0
        }
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
