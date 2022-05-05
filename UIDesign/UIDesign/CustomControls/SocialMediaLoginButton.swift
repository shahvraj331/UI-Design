//
//  SocialMediaLoginButton.swift
//  UIDesign
//
//  Created by Vraj Shah on 03/05/22.
//

import UIKit

@IBDesignable
/// Button for setting up image and padding between image and label of button
class SocialMediaLoginButton: UIButton {
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    //MARK: - IBInspectables
    @IBInspectable var SocialMediaImage: UIImage? {
        didSet {
            addImage()
        }
    }
    
    @IBInspectable var padding: CGFloat = 0 {
        didSet {
            configuration?.imagePadding = padding
        }
    }
    
    @IBInspectable var fontSize: CGFloat = 12.0 {
        didSet {
            self.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: fontSize)
        }
    }
    
    @IBInspectable var labelColor: UIColor = UIColor.white {
        didSet {
            self.setTitleColor(labelColor, for: .normal)
        }
    }
    
    //MARK: - File private functions
    fileprivate func addImage() {
        if let image = SocialMediaImage {
            setImage(image, for: .normal)
            configuration?.imagePlacement = .leading
        }
    }
    
    fileprivate func initialSetup() {
        backgroundColor = UIColor.white
        layer.cornerRadius = 15.0
        layer.masksToBounds = true
    }
    
}//End of class
