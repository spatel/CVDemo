//
//  RootCoordinator.swift
//  CVDemo
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation
import UIKit

class RootCoordinator: Coordinator {
    
    private let window: UIWindow
    
    // Child coordinators
    private var cvDemoCoordinator: CVDemoCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        self.cvDemoCoordinator = CVDemoCoordinator(window: window)
        cvDemoCoordinator?.start()
    }
}
