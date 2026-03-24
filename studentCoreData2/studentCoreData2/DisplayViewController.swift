//
//  DisplayViewController.swift
//  studentCoreData2
//
//  Created by Tithi Shah on 3/24/26.
//

import UIKit
import CoreData
import Foundation

struct student
{
    var id: Int32
    var name:String
    var email:String
    var date:Date
    var dept:String
    
}

class DisplayViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let student = studList[indexPath.row]
        let formatter = DateFormatter()
        
        cell.textLabel?.text = "\(student.id) - \(student.name)"
        let dateString = formatter.string(from: student.date)
        cell.detailTextLabel?.text = "Email: \(student.email) | Date: \(dateString) | Dept: \(student.dept)"
        return cell
    }
    
    @IBOutlet weak var tbView: UITableView!

    var studList = [student]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.delegate = self
        tbView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }

    func fetchData() {
        studList.removeAll()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: "Student")

        do {
            let result = try context.fetch(request)
            for data in result {
                let id = data.value(forKey: "studentid") as! Int32
                let name = data.value(forKey: "name") as! String
                let email = data.value(forKey: "email") as! String
                let date = data.value(forKey: "date") as! Date
                let dept = data.value(forKey: "dept") as? String ?? ""

                let s1 = student(id: id, name: name, email: email, date: date, dept: dept)
                studList.append(s1)
            }
            tbView.reloadData()
            print("Fetched")
        } catch {
            print("Error Fetching Data")
        }
    }

    // MARK: - Update and Delete logic
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let updateAction = UIContextualAction(style: .normal, title: "Update") { (action, view, completion) in
            self.showUpdateAlert(for: indexPath)
            completion(true)
        }
        updateAction.backgroundColor = .systemBlue

        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.performDelete(at: indexPath)
            completion(true)
        }

        return UISwipeActionsConfiguration(actions: [deleteAction, updateAction])
    }

    func showUpdateAlert(for indexPath: IndexPath) {
        let currentStudent = studList[indexPath.row]
        let alert = UIAlertController(title: "Update Student", message: "Edit student details", preferredStyle: .alert)

        alert.addTextField { $0.text = currentStudent.name }
        alert.addTextField { $0.text = currentStudent.email }
        alert.addTextField { $0.text = currentStudent.dept }

        let updateBtn = UIAlertAction(title: "Update", style: .default) { _ in
            let newName = alert.textFields?[0].text ?? ""
            let newEmail = alert.textFields?[1].text ?? ""
            let newDept = alert.textFields?[2].text ?? ""
            self.performUpdate(at: indexPath, name: newName, email: newEmail, dept: newDept)
        }

        alert.addAction(updateBtn)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }

    func performUpdate(at indexPath: IndexPath, name: String, email: String, dept: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: "Student")
        
        let studentToUpdate = studList[indexPath.row]
        request.predicate = NSPredicate(format: "studentid == %d", studentToUpdate.id)

        do {
            let result = try context.fetch(request)
            if let objectToUpdate = result.first {
                objectToUpdate.setValue(name, forKey: "name")
                objectToUpdate.setValue(email, forKey: "email")
                objectToUpdate.setValue(dept, forKey: "dept")
                try context.save()
                
                let successAlert = UIAlertController(title: "Success", message: "Record updated successfully", preferredStyle: .alert)
                successAlert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(successAlert, animated: true)
                
                fetchData()
            }
        } catch {
            print("Error updating data: \(error)")
        }
    }

    func performDelete(at indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: "Student")
        
        let studentToDelete = studList[indexPath.row]
        request.predicate = NSPredicate(format: "studentid == %d", studentToDelete.id)

        do {
            let result = try context.fetch(request)
            if let objectToDelete = result.first {
                context.delete(objectToDelete)
                try context.save()
                
                let successAlert = UIAlertController(title: "Success", message: "Record deleted successfully", preferredStyle: .alert)
                successAlert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(successAlert, animated: true)
                
                fetchData()
            }
        } catch {
            print("Error deleting data: \(error)")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
