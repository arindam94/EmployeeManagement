//
//  EmployeeDetailsCell.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 10/10/23.
//

import UIKit

class EmployeeDetailsCell: UITableViewCell {

    @IBOutlet weak private var labelName: UILabel!
    @IBOutlet weak private var labelEmail: UILabel!
    @IBOutlet weak private var labelPhone: UILabel!
    @IBOutlet weak private var labelCompany: UILabel!
    @IBOutlet weak private var labelDepartment: UILabel!
    
    var employeeDetails: EmployeeInfo?{
        didSet{
            if let employeeDetails = employeeDetails{
                labelName.text = "\(employeeDetails.firstName ?? "") \(employeeDetails.maidenName ?? "") \(employeeDetails.lastName ?? "")"
                labelEmail.text = "\(employeeDetails.email ?? "-")"
                labelPhone.text = "\(employeeDetails.phone ?? "-")"

                if let companyData = employeeDetails.company{
                    labelCompany.text = "\(companyData.name ?? "-")"
                    labelDepartment.text = "\(companyData.department ?? "-")"
                }
                
            }
        }
    }

}
