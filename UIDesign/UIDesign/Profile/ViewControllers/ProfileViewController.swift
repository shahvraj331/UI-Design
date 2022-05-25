//
//  ProfileViewController.swift
//  UIDesign
//
//  Created by Vraj Shah on 04/05/22.
//

import UIKit

class ProfileViewController: UIViewController, Storyboarded {

    //MARK: - Variables
    let countryCode = ["+0","+1","+2","+3","+4","+5"]
    var coordinator: BaseCoordinator?
    
    //MARK: - Outlets
    @IBOutlet weak var maleRadioButton: WhiteRoundButton!
    @IBOutlet weak var femaleRadioButton: WhiteRoundButton!
    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtCountryCode: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtFullName: CustomTextField!
    @IBOutlet weak var txtDateOfBirth: CustomTextField!
    @IBOutlet weak var txtEmailAddress: CustomTextField!
    @IBOutlet weak var txtLocation: CustomTextField!
    @IBOutlet weak var btnLogOut: UIButton!
    
    //MARK: - UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPhoneNumberView()
        createPickerView()
        maleRadioButton.isSelected = true
        btnLogOut.layer.cornerRadius = 15.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    //MARK: - Actions
    @IBAction func maleButtonAction(_ sender: UIButton) {
        if !sender.isSelected && femaleRadioButton.isSelected {
            sender.isSelected = true
            femaleRadioButton.isSelected = false
        }
    }
    
    @IBAction func femaleButtonAction(_ sender: UIButton) {
        if !sender.isSelected && maleRadioButton.isSelected {
            sender.isSelected = true
            maleRadioButton.isSelected = false
        }
    }
    
    @IBAction func logOutUser(_ sender: UIButton) {
        UserDefaults.standard.setUserLoggedIn(false)
        coordinator?.finish()
    }
    
    //MARK: - File private functions
    fileprivate func setUpPhoneNumberView() {
        phoneNumberView.layer.cornerRadius = 10.0
        phoneNumberView.backgroundColor = UIColor.white
        phoneNumberView.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        phoneNumberView.layer.shadowRadius = 5.0
        phoneNumberView.layer.shadowOpacity = 1.0
        phoneNumberView.layer.shadowColor = UIColor(red: 0.6, green: 0.67, blue: 0.78, alpha: 0.18).cgColor
    }
    
    fileprivate func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        txtCountryCode.inputView = pickerView
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.exitPickerView))
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        txtCountryCode.inputAccessoryView = toolBar
    }
    
    @objc func exitPickerView() {
          view.endEditing(true)
    }
    
}//End of class

//MARK: - UIPickerViewDelegate
extension ProfileViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryCode[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCountry = countryCode[row]
        txtCountryCode.text = selectedCountry
    }
    
}//End of extension

//MARK: - UIPickerViewDataSource
extension ProfileViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryCode.count
    }
    
}//End of extension

//MARK: - UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtFullName:
            txtDateOfBirth.becomeFirstResponder()
        case txtDateOfBirth:
            txtEmailAddress.becomeFirstResponder()
        case txtEmailAddress:
            txtPhoneNumber.becomeFirstResponder()
        case txtPhoneNumber:
            txtLocation.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
}//End of extension
