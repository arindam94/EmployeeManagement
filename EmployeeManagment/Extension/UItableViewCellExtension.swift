//
//  UItableViewCellExtension.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import UIKit

//MARK: Cell Extension for registering cell
extension UITableViewCell {
    static func registerCellWithTableView(tablView: UITableView) {
        let nibName = String(describing: Self.self)
        let nib = UINib(nibName: nibName, bundle: nil)
        tablView.register(nib, forCellReuseIdentifier: nibName)
    }
}
