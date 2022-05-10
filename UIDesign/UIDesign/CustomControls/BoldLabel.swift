//
//  BoldLabel.swift
//  UIDesign
//
//  Created by Vraj Shah on 04/05/22.
//

import UIKit

/// Class for changing font weight to bold
class BoldLabel: BaseLabel {

    //MARK: - Override function
    override func updateLabel() {
        font = UIFont(name: "OpenSans-Bold", size: textSize)
    }

}//End of class
