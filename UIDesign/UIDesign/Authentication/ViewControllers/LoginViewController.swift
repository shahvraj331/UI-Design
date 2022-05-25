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
    let viewModel = LogInViewModel()
    
    //MARK: - Outlets
    @IBOutlet weak var btnRememberMe: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var btnLogin: BaseButton!
    
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
        coordinator?.startSignUpScreen()
    }
    
    @IBAction func profileAction(_ sender: UIButton) {
        validateInputs()
    }
    
    //MARK: - File private functions
    fileprivate func initViewController() {
        btnRememberMe.layer.cornerRadius = 5.0
        btnRememberMe.layer.masksToBounds = true
    }
    
    fileprivate func bindViewModel() {
        viewModel.logInResponse = { [weak self] responseData in
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
        guard let email = txtEmail.trimmedtext() else { return }
        guard let password = txtPassword.trimmedtext() else { return }
        switch true {
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
            viewModel.logInUser(headers: defaultHeader, parameters: data)
            self.updateBufferStatus(true)
        }
    }
    
    fileprivate func updateBufferStatus(_ status: Bool) {
        if status {
            activityIndicator.startAnimating()
            btnLogin.alpha = 0.0
        } else {
            activityIndicator.stopAnimating()
            btnLogin.alpha = 100.0
        }
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
