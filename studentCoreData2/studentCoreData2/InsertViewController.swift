//
//  InsertViewController.swift
//  studentCoreData2
//
//  Created by Tithi Shah on 3/24/26.
//

import UIKit
import CoreData
import Foundation
class InsertViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    let departments = ["Computer", "IT", "Civil", "Mechanical", "Electrical"]
    var selectedDept = "Computer"
    
    @IBOutlet weak var deptinput: UIPickerView!
    @IBOutlet weak var dateinput: UIDatePicker!
    @IBOutlet weak var emailinput: UITextField!
    @IBOutlet weak var nameinput: UITextField!
    @IBOutlet weak var idInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        deptinput.delegate = self
        deptinput.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return departments.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return departments[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDept = departments[row]
    }
    
    @IBAction func insertbtn(_ sender: UIButton) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context)
        let studentid = Int32(idInput.text!) ?? 0
        let name = nameinput.text!
        let email = emailinput.text!
        let date = dateinput.date
        
        newItem.setValue(studentid, forKey: "studentid")
        newItem.setValue(name, forKey: "name")
        newItem.setValue(email, forKey: "email")
        newItem.setValue(date, forKey: "date")
        newItem.setValue(selectedDept, forKey: "dept")
        
        do{
            try context.save()
            print("Saved")
            
            let alert = UIAlertController(title: "Success", message: "Student record inserted successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
            
        }catch
        {
            print("Not Saved")
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
