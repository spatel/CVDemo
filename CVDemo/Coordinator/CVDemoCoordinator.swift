//
//  CVDemoCoordinator.swift
//  CVDemo
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation
import UIKit

class CVDemoCoordinator: Coordinator {
    
    private let window: UIWindow
    private var navController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        let demoViewController = CVDemoViewController()
        
        //
        // Can potentially handle navigation specific logic here e.g.
        //
        // demoController.goToDetailScreen = {
        //     // push / present detail screen view controller
        // }
        //
        
        let listNavigationController = UINavigationController(rootViewController: demoViewController)
        self.navController = listNavigationController
        
        window.rootViewController = listNavigationController
        window.makeKeyAndVisible()
    }
}
