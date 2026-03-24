//
//  ViewController.swift
//  EmployeeCoreData
//
//  Created by Tithi Shah on 3/24/26.
//

import UIKit
import CoreData

struct MyEmployee
{
    var id: Int32
    var name : String
    var dept: String
    var joinDate : Date
    
}

class ViewController: UIViewController {

    
    @IBOutlet var addBtn: UIButton!
    @IBOutlet var EmployeeTable: UITableView!
    var employee : [MyEmployee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

@IBAction func addBtnTapped(_ sender: Any) {
   
//    let nextVC = AddEmployeeVC()
//    navigationController?.pushViewController(nextVC, animated: true)
    
    }
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employee.count
    }
    
    func inintTableView() {
        EmployeeTable.delegate = self
        EmployeeTable.dataSource = self
        EmployeeTable.register(UITableViewCell.self, forCellReuseIdentifier: "EmployeeTVCell")
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employeeCell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTVCell", for: indexPath) as! EmplyeeTVCell
        
        employeeCell.nameLabel.text = employee[indexPath.row].name
        employeeCell.dojLabel.text = "\(employee[indexPath.row].joinDate)"
        employeeCell.departmentLabel.text = employee[indexPath.row].dept
        
        return employeeCell
    }
    
    
}
