//
//  TextButton.swift
//  UIDesign
//
//  Created by Vraj Shah on 03/05/22.
//

import UIKit

@IBDesignable
/// Button with default background and containing only text
class BaseTextButton: UIButton {
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - IBInspectable
    @IBInspectable var labelSize: CGFloat = 10.0 {
        didSet {
            titleLabel?.font = UIFont(name: "OpenSans-Regular", size: labelSize)
        }
    }
    
    @IBInspectable var labelColor: UIColor = UIColor.black {
        didSet {
            setTitleColor(labelColor, for: .normal)
        }
    }
    
    @IBInspectable var isSemiBold: Bool = false {
        didSet {
            titleLabel?.font = isSemiBold ? UIFont(name: "OpenSans-SemiBold", size: labelSize) : UIFont(name: "OpenSans-Regular", size: labelSize)
        }
    }
    
}//End of class
