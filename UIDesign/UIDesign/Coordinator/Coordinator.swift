//
//  Coordinator.swift
//  UIDesign
//
//  Created by Vraj Shah on 03/05/22.
//

import UIKit

protocol Coordinator {
    var navController: UINavigationController { get set }
    func start()
    func finish()
    func finishToRoot()
}
