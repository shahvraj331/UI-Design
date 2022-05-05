//
//  CustomTextField.swift
//  UIDesign
//
//  Created by Vraj Shah on 28/04/22.
//

import UIKit

@IBDesignable
/// Custom textfield containing right view button
class CustomTextField: UITextField {
    
    //MARK: - Override function
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: 0, left: imageEndPadding, bottom: 0, right: 0))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: 0, left: textStartPadding, bottom: 0, right: 0))
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: 0, left: textStartPadding, bottom: 0, right: 0))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: 0, left: textStartPadding, bottom: 0, right: 0))
    }
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        initTextfield()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initTextfield()
    }
    
    //MARK: - IBInspectables
    @IBInspectable var textStartPadding: CGFloat = 16
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            setUpRightView()
        }
    }
    
    @IBInspectable var imageEndPadding: CGFloat = -20.0 {
        didSet {
            imageEndPadding = imageEndPadding * -1
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    //MARK: - Class functions
    func initTextfield() {
        layer.shadowOffset = CGSize(width: 0, height: 4.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1.0
        layer.shadowColor = UIColor(red: 0.6, green: 0.67, blue: 0.78, alpha: 0.18).cgColor
    }
    
    func setUpRightView() {
        let eyeButton = UIButton()
        if let image = rightImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 34))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            eyeButton.setImage(image, for: .normal)
            rightView = eyeButton
            eyeButton.addTarget(self, action: #selector(changePasswordSecurity), for: .touchUpInside)
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
    }
    
    @objc fileprivate func changePasswordSecurity() {
        isSecureTextEntry = !isSecureTextEntry
    }
    
}//End of class
