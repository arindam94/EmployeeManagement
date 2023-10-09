//
//  EmployeeTableDataSource.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 09/10/23.
//

import UIKit
enum EmployeeListSection: Hashable, CaseIterable{
    case main
}

final class EmployeeTableDataSource: UITableViewDiffableDataSource<EmployeeListSection, EmployeeInfo>{
    init(tableView: UITableView) {
        super.init(tableView: tableView) { tableView, indexPath, itemIdentifier in
            let cellIdentifier = String(describing: EmployeeListCell.self)
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            guard let cell = cell as? EmployeeListCell else{return UITableViewCell()}
            cell.employeeDetails = itemIdentifier
            return cell
        }
    }
    
    
    
    
}
