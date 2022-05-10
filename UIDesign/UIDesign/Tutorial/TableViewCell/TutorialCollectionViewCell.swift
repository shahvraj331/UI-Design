//
//  TutorialCollectionViewCell.swift
//  UIDesign
//
//  Created by Vraj Shah on 04/05/22.
//

import UIKit

class TutorialCollectionViewCell: UICollectionViewCell {
        
    //MARK: - Outlets
    @IBOutlet weak var imgTutorial: UIImageView!
    @IBOutlet weak var txtDescription: UILabel!
    
    //MARK: - UICollectionViewCell lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Class functions
    func initializeCell(_ tutorialData: TutorialData?) {
        imgTutorial.image = tutorialData?.image
        txtDescription.text = tutorialData?.description
    }
    
}//End of class
