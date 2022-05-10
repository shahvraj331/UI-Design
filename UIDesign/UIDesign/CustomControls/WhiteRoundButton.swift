//
//  WhiteRoundButton.swift
//  UIDesign
//
//  Created by Vraj Shah on 05/05/22.
//

import UIKit

/// Button with round corner, white background and a drop shadow
class WhiteRoundButton: UIButton {
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initButton()
    }

    //MARK: - IBInspectable
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    //MARK: - Class functions
    func initButton() {
        layer.cornerRadius = cornerRadius
        backgroundColor = UIColor.white
        layer.shadowOffset = CGSize(width: 0, height: 4.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1.0
        layer.shadowColor = UIColor(red: 0.6, green: 0.67, blue: 0.78, alpha: 0.18).cgColor
    }
    
}//End of class
