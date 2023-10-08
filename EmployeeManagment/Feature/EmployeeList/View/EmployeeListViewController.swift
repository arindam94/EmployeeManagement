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
        
        
    }
    
    fileprivate func setupUI(){
        employeeTable.dataSource = self
        employeeTable.delegate = self
    }


}

extension EmployeeListViewController: EmployeeListViewInterface, UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeeData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .cyan
        return cell
    }
    
    
    func showListOfEmployee(list: EmployeeData) {
        self.employeeData = list.users!
        self.employeeTable.reloadData()
    }
    
    func showError(errorMessage: String) {
        let alert = UIAlertController(title: EmployeeApp.error.localized, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: EmployeeApp.ok.localized, style: .cancel))
        present(alert, animated: true)
    }
    
    
}

