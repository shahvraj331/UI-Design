//
//  BaseLabel.swift
//  UIDesign
//
//  Created by Vraj Shah on 02/05/22.
//

import UIKit

@IBDesignable
/// Base label having common font
class BaseLabel: UILabel {
    
    //MARK: - Variables
    let boldTextColor = UIColor(red: 0.08, green: 0.04, blue: 0.24, alpha: 1)
    let normalTextColor = UIColor(red: 0.32, green: 0.29, blue: 0.42, alpha: 1)
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - IBInspectables
    @IBInspectable var textSize: CGFloat = 12.0 {
        didSet {
            updateLabel()
        }
    }
    
    @IBInspectable var isBold: Bool = false {
        didSet {
            textColor = isBold ? boldTextColor : normalTextColor
        }
    }
    
    //MARK: Class function
    func updateLabel() {
        font = UIFont(name: "OpenSans-Regular", size: textSize)
    }
    
}//End of class
