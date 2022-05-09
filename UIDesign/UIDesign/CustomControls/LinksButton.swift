//
//  LinksButton.swift
//  UIDesign
//
//  Created by Vraj Shah on 03/05/22.
//

import UIKit

/// Button for text containing link
class LinksButton: UIButton {
    
    // MARK: - IBInspectable
    @IBInspectable var text: String = "" {
        didSet {
            linkStrings()
        }
    }
    
    @IBInspectable var link: String = "" {
        didSet {
            linkStrings()
        }
    }
    
    //MARK: - Class functions
    func linkStrings() {
        let mainString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.494, green: 0.482, blue: 0.592, alpha: 1), NSAttributedString.Key.font : UIFont(name: "OpenSans-Regular", size: 12) ?? UIFont.systemFont(ofSize: 14)])
        let coloredString = NSAttributedString(string: link, attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue, NSAttributedString.Key.font : UIFont(name: "OpenSans-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12)])
        mainString.append(coloredString)
        self.setAttributedTitle(mainString, for: .normal)
    }
 
}// End of class
