//
//  UIKit+Extensions.swift
//  CVDemo
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIViewController extensions
extension UIViewController {
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Reusable
public protocol Reusable: class {
    static var reuseId: String { get }
}
public extension Reusable {
    static var reuseId: String { return String(describing: self) }
}

// MARK: - UITableView extensions
extension UITableView {
    
    // MARK: - Cell registration / dequeuing
    
    public func registerReusableCell<Cell: UITableViewCell>(_: Cell.Type) where Cell: Reusable {
        register(Cell.self, forCellReuseIdentifier: Cell.reuseId)
    }
    
    public func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell where Cell: Reusable {
        return dequeueReusableCell(withIdentifier: Cell.reuseId, for: indexPath) as! Cell
    }
}
