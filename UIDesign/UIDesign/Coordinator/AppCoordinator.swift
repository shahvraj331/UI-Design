//
//  AppCoordinator.swift
//  UIDesign
//
//  Created by Vraj Shah on 03/05/22.
//

import UIKit

class AppCoordinator: Coordinator {
    var navController: UINavigationController
    
    init (_ navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let loginVC = BaseCoordinator(navController)
        loginVC.start()
    }
    
    func finish() {
        navController.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController.popToRootViewController(animated: true)
    }
    
}//End of class
