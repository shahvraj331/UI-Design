//
//  BaseCoordinator.swift
//  UIDesign
//
//  Created by Vraj Shah on 03/05/22.
//

import UIKit

class BaseCoordinator: Coordinator {
    var navController: UINavigationController
    
    init(_ navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let tutorialVC = TutorialViewController.instantiate(from: .tutorialStoryboard)
        tutorialVC.coordinator = self
        navController.pushViewController(tutorialVC, animated: true)
    }
    
    func startLogInScreen() {
        let loginVC = LoginViewController.instantiate(from: .main)
        loginVC.coordinator = self
        navController.pushViewController(loginVC, animated: true)
    }
    
    func startSignUpScreen() {
        let signUpVC = SignUpViewController.instantiate(from: .main)
        signUpVC.coordinator = self
        navController.pushViewController(signUpVC, animated: true)
    }
    
    func startProfileScreen() {
        let profileVC = ProfileViewController.instantiate(from: .profileStoryboard)
        profileVC.coordinator = self
        navController.pushViewController(profileVC, animated: true)
    }
    
    func finish() {
        navController.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController.popToRootViewController(animated: true)
    }
    
}//End of class
