//
//  EmployeeDetailsVC.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 10/10/23.
//

import UIKit

protocol EmployeeDetailsViewInterface: AnyObject{
    func showEmployeeDetails(info: EmployeeInfo)
}

class EmployeeDetailsViewController: UIViewController {
    @IBOutlet weak var employeeDetailsTableView: UITableView!
    
//    var prersenter: EmployeeDetailsPresenterInterface?
     var employeeData: EmployeeInfo?
    var interactor: EmployeeDetailsInteractorInterface?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.showEmployeeData()
    }
    
    fileprivate func setupUI(){
        employeeDetailsTableView.dataSource = self
        employeeDetailsTableView.delegate = self
        EmployeeDetailsCell.registerCellWithTableView(tablView: employeeDetailsTableView)
        employeeDetailsTableView.accessibilityIdentifier = "myDetailsTableViewIdentifier"

    }
}

extension EmployeeDetailsViewController: EmployeeDetailsViewInterface, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeDetailsCell") as! EmployeeDetailsCell
        cell.employeeDetails = self.employeeData
        return cell
    }
    
    func showEmployeeDetails(info: EmployeeInfo) {
        DispatchQueue.main.async {
            self.employeeData = info
            self.employeeDetailsTableView.reloadData()
        }
    }
}
