//
//  AppDelegate.swift
//  CVDemo
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var rootCoordinator: RootCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        self.rootCoordinator = RootCoordinator(window: window)
        self.rootCoordinator?.start()
        
        return true
    }

}

