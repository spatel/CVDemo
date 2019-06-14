//
//  CVCells.swift
//  CVDemo
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation
import UIKit

class CVTextCell: UITableViewCell, Reusable {
    
    @discardableResult
    func configure(with text: String) -> Self {
        self.textLabel?.numberOfLines = 0 // Required for automatic cell height
        self.textLabel?.text = text
        return self
    }
}
