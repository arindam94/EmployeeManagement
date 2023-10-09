//
//  ViewController.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 06/10/23.
//

import UIKit

protocol EmployeeListViewInterface: AnyObject{
    func showListOfEmployee(list: EmployeeData)
    func showError(errorMessage: String)
}

class EmployeeListViewController: UIViewController {

    var interactor: EmployeeListInteractor?
    @IBOutlet var employeeTable: UITableView!
    var employeeData: [EmployeeInfo] = []
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        interactor?.getListofEmployee()
        setupUI()
    }
    
    fileprivate func setupUI(){
        employeeTable.dataSource = self
        employeeTable.delegate = self
        EmployeeListCell.registerCellWithTableView(tablView: employeeTable)
    }


}

extension EmployeeListViewController: EmployeeListViewInterface, UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeListCell") as! EmployeeListCell
        cell.selectionStyle = .none
        cell.employeeDetails = self.employeeData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    func showListOfEmployee(list: EmployeeData) {
        debugPrint(list.users)
        self.employeeData = list.users!
        self.employeeTable.reloadData()
    }
    
    func showError(errorMessage: String) {
        let alert = UIAlertController(title: EmployeeApp.error.localized, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: EmployeeApp.ok.localized, style: .cancel))
        present(alert, animated: true)
    }
    
    
}

