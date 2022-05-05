//
//  SemiBoldLabel.swift
//  UIDesign
//
//  Created by Vraj Shah on 02/05/22.
//

import UIKit

/// Class for changing font weight to semi-bold
class SemiBoldLabel: BaseLabel {
    
    //MARK: - Override function
    override func updateLabel() {
        font = UIFont(name: "OpenSans-SemiBold", size: textSize)
    }
    
}//End of class
