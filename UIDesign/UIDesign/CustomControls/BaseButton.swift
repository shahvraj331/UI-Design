//
//  CustomButton.swift
//  UIDesign
//
//  Created by Vraj Shah on 28/04/22.
//

import UIKit

@IBDesignable
/// Base button used in the application
class BaseButton: UIButton {
    
    //MARK: - Variables
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.colors = [
            UIColor(red: 0.46, green: 0.32, blue: 1.0, alpha: 1.0).cgColor,
            UIColor(red: 0.66, green: 0.58, blue: 1.0, alpha: 1.0).cgColor
        ]
        gradient.cornerRadius = 15.0
        gradient.shadowColor = UIColor(red: 0.6, green: 0.67, blue: 0.78, alpha: 0.18).cgColor
        gradient.shadowOffset = CGSize(width: 0, height: 4.0)
        gradient.shadowRadius = 5.0
        gradient.masksToBounds = false
        gradient.locations = [0.0, 1.0]
        return gradient
    }()
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.removeFromSuperlayer()
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    //MARK: - IBInspectable
    @IBInspectable var fontSize: CGFloat = 12 {
        didSet {
            self.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: fontSize)
        }
    }
    
    @IBInspectable var textColor: UIColor = UIColor.white {
        didSet {
            self.setTitleColor(textColor, for: .normal)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 12 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    //MARK: - Fileprivate functions
    fileprivate func commonInit() {
        self.layer.insertSublayer(gradient, at: 0)
    }
    
}//End of class
