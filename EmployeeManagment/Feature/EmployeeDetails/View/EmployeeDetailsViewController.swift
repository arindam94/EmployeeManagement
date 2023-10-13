//
//  EmployeeDetailsVC.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 10/10/23.
//

import UIKit

protocol EmployeeDetailsViewDelegate: AnyObject {
    func showEmployeeDetails(info: EmployeeInfo)
}

final class EmployeeDetailsViewController: UIViewController {
    @IBOutlet weak private var employeeDetailsTableView: UITableView!
    
    private var employeeData: EmployeeInfo?
    var interactor: EmployeeDetailsInteractorInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.showEmployeeData()
    }
    
    fileprivate func setupUI() {
        employeeDetailsTableView.dataSource = self
        employeeDetailsTableView.delegate = self
        EmployeeDetailsCell.registerCellWithTableView(tablView: employeeDetailsTableView)
        employeeDetailsTableView.accessibilityIdentifier = "myDetailsTableViewIdentifier"
    }
    
}

//MARK: - EmployeeDetailsViewDelegate Protocol Implementation
extension EmployeeDetailsViewController: EmployeeDetailsViewDelegate {
    func showEmployeeDetails(info: EmployeeInfo) {
        DispatchQueue.main.async {
            self.employeeData = info
            self.employeeDetailsTableView.reloadData()
        }
    }
}

extension EmployeeDetailsViewController:  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.employeeDetailsCellIdentifier) as? EmployeeDetailsCell {
            cell.employeeDetails = self.employeeData
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
}
