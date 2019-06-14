//
//  Coordinator.swift
//  CVDemo
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation

//
// Coordinators can be used to make view controllers more reusable and can help to decouple some
// of the navigation logic. They're overkill for a smaller app (like this demo) but I've included them just to
// show potential ways of making an app more scalable.
//
protocol Coordinator {
    func start()
}
