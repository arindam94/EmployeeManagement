//
//  EmployeeListCell.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import UIKit

class EmployeeListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var employeeDetails: EmployeeInfo?{
        didSet{
            guard let employeeDetails = employeeDetails else{
                return
            }
            profileImageView.load(url: URL(string: employeeDetails.image ?? "")!)
            nameLabel.text = employeeDetails.firstName ?? ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
