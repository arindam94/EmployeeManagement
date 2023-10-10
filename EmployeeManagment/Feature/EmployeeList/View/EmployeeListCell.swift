//
//  EmployeeListCell.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import UIKit

class EmployeeListCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var profileImageView: UIImageView!
    
    var employeeDetails: EmployeeInfo?{
        didSet{
            guard let employeeDetails = employeeDetails else{
                return
            }
            if let url = URL(string: employeeDetails.image ?? ""){
                profileImageView.load(url: url)
            }
            nameLabel.text = "\(employeeDetails.firstName ?? "") \(employeeDetails.maidenName ?? "") \(employeeDetails.lastName ?? "")"
        }
    }
    

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
