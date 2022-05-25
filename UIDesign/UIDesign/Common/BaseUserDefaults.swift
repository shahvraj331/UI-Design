//
//  BaseUserDefaults.swift
//  UIDesign
//
//  Created by Vraj Shah on 26/05/22.
//

import UIKit

extension UserDefaults {
    
    //MARK: - Tutorial user defaults
    func isTutorialCompleted() -> Bool {
        return bool(forKey: UserDefaultKeys.tutorialKey.rawValue)
    }
    
    func setTutorialCompleted() {
        set(true, forKey: UserDefaultKeys.tutorialKey.rawValue)
    }
    
    //MARK: - Logged in user defaults
    func isUserLoggedIn() -> Bool {
        return bool(forKey: UserDefaultKeys.userLogInKey.rawValue)
    }
    
    func setUserLoggedIn(_ value: Bool) {
        set(value, forKey: UserDefaultKeys.userLogInKey.rawValue)
    }
    
}//End of extension
