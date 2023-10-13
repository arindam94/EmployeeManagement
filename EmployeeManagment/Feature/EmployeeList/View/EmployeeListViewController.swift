//
//  ViewController.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 06/10/23.
//

import UIKit

// MARK: - EmployeeListViewController Protocol
protocol EmployeeListViewDelegate: AnyObject {
    func showListOfEmployee(list: EmployeeData)
    func showError(errorMessage: String)
}

final class EmployeeListViewController: UIViewController {

    @IBOutlet weak private var employeeTable: UITableView!

    var interactor: EmployeeListInteractor?
    private var employeeData: [EmployeeInfo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getListofEmployee()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUI()
    }

    private func setupUI() {
        employeeTable.accessibilityIdentifier = "myTableViewIdentifier"
        EmployeeListCell.registerCellWithTableView(tablView: employeeTable)
    }
}

extension EmployeeListViewController: EmployeeListViewDelegate {

    // MARK: - Will provide datasource of employee , next reload table view
    func showListOfEmployee(list: EmployeeData) {
        self.employeeData = list.users!
        self.employeeTable.reloadData()
    }

    // MARK: - On fetching data from api any error , will show by error message
    func showError(errorMessage: String) {
        let alert = UIAlertController(title: EmployeeApp.error.localized, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: EmployeeApp.okTitle.localized, style: .cancel))
        present(alert, animated: true)
    }
}

extension EmployeeListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeeData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        Constants.lististCellIdentifier) as? EmployeeListCell {
            cell.employeeDetails = self.employeeData[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.employeeListCellHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.showEmployeeDetails(index: indexPath.row)
    }
}
