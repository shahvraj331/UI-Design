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
        let loginVC = LoginViewController.instantiate(from: .main)
        loginVC.coordinator = self
        navController.pushViewController(loginVC, animated: true)
    }
    
    func startSignUpScreen() {
        let signUpVC = SignUpViewController.instantiate(from: .main)
        signUpVC.coordinator = self
        navController.pushViewController(signUpVC, animated: true)
    }
    
    func finish() {
        navController.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController.popToRootViewController(animated: true)
    }
    
}//End of class
