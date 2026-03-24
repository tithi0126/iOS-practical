//
//  ViewController.swift
//  coreDataDemo2
//
//  Created by NISHA RANA on 07/03/26.
//

import UIKit
import CoreData

extension Student {
    
    func toDisplayModel()->StudentDisplayModel{
        return StudentDisplayModel(
            id: id ,
            name: name ?? "" ,
            gender: gender ?? "" ,
            course: course ?? "" ,
            enrollment: enrollment ?? Date()
        )
    }
}

struct StudentDisplayModel{
    let id : Int32
    let name : String
    let gender : String
    let course: String
    let enrollment : Date
    
    var formattedDate : String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: enrollment)
    }
}
// MARK: - Student Model (Struct for display)

// MARK: - Main View Controller (Student List Page)
class ViewController: UIViewController {
    
    
    // MARK: - Outlets
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    // MARK: - Properties
    var studList = [StudentDisplayModel]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Print database location
        let filePath = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
        print("Database Open At: ", filePath ?? "")
        
        setupTableView()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData() // Refresh data when coming back from add/edit page
    }
    
    // MARK: - Setup
    func setupTableView() {
        tblView.delegate = self
        tblView.dataSource = self
        // tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // Moved to Storyboard for Subtitle style
    }
    
    // MARK: - Core Data Operations
    
    // READ - Fetch all students
    func fetchData() {
        let request: NSFetchRequest<Student> = Student.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            let result = try context.fetch(request)
            studList.removeAll()
            
            for data in result {
                studList.append(data.toDisplayModel())
            }
            tblView.reloadData()
            print("Fetched \(studList.count) students")
        } catch {
            print("Failed to fetch: \(error)")
            showAlert(message: "Failed to load students")
        }
    }
    
    // DELETE - Remove student
    func deleteStudent(at indexPath: IndexPath) {
        let studentToDelete = studList[indexPath.row]
        
        let request: NSFetchRequest<Student> = Student.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", studentToDelete.id)
        
        do {
            let results = try context.fetch(request)
            if let student = results.first {
                context.delete(student)
                try context.save()
                studList.remove(at: indexPath.row)
                tblView.deleteRows(at: [indexPath], with: .fade)
                showAlert(message: "Student deleted successfully!")
            }
        } catch {
            print("Failed to delete: \(error)")
            showAlert(message: "Failed to delete student")
        }
    }
    
    // MARK: - Navigation
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToAddEdit", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAddEdit" {
            let destinationVC = segue.destination as! AddEditStudentViewController
            
            if let student = sender as? StudentDisplayModel {
                // Edit mode - pass existing student
                destinationVC.studentToEdit = student
                destinationVC.isEditMode = true
            } else {
                // Add mode
                destinationVC.studentToEdit = nil
                destinationVC.isEditMode = false
            }
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Notice", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - UITableView Delegate & DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let student = studList[indexPath.row]
        
        // Configure cell
        cell.textLabel?.text = "\(student.id) - \(student.name)"
        cell.detailTextLabel?.text = "📚 \(student.course) | 👤 \(student.gender) | 📅 \(student.formattedDate)"
        
        // Style cell
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.detailTextLabel?.textColor = .gray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let student = studList[indexPath.row]
        performSegue(withIdentifier: "goToAddEdit", sender: student)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteStudent(at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

// MARK: - Add/Edit Student View Controller (Second Page)
class AddEditStudentViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var courseTextField: UITextField!
    @IBOutlet weak var enrollmentPicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var pageTitle: UILabel!
    
    // MARK: - Properties
    var studentToEdit: StudentDisplayModel?
    var isEditMode = false
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Dropdown options
    let genderOptions = ["Male", "Female", "Other"]
    let courseOptions = ["Computer Science", "Information Technology", "Electronics", "Mechanical", "Civil"]
    
    // Picker views for dropdowns
    var genderPickerView: UIPickerView!
    var coursePickerView: UIPickerView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupPickerViews()
        setupNavigationBar()
        
        if isEditMode, let student = studentToEdit {
            loadStudentData(student)
            pageTitle.text = "Edit Student"
            saveButton.setTitle("Update", for: .normal)
        } else {
            pageTitle.text = "Add New Student"
            saveButton.setTitle("Save", for: .normal)
            generateNextID()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardNotifications()
    }
    
    // MARK: - Setup Methods
    func setupUI() {
        // Style text fields
        let textFields = [idTextField, nameTextField, genderTextField, courseTextField]
        for textField in textFields {
            textField?.borderStyle = .roundedRect
            textField?.layer.cornerRadius = 8
            textField?.layer.borderWidth = 1
            textField?.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        // Style buttons
        saveButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        
        // Add padding to scroll view
        scrollView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        // Add tap gesture to dismiss keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    func setupPickerViews() {
        // Gender Picker
        genderPickerView = UIPickerView()
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        genderPickerView.tag = 1
        genderTextField.inputView = genderPickerView
        
        // Course Picker
        coursePickerView = UIPickerView()
        coursePickerView.delegate = self
        coursePickerView.dataSource = self
        coursePickerView.tag = 2
        courseTextField.inputView = coursePickerView
        
        // Add toolbar with done button for pickers
        addToolbarToTextField(genderTextField)
        addToolbarToTextField(courseTextField)
        
        // Set initial picker values if in edit mode
        if isEditMode {
            if let gender = studentToEdit?.gender {
                if let index = genderOptions.firstIndex(of: gender) {
                    genderPickerView.selectRow(index, inComponent: 0, animated: false)
                }
            }
            if let course = studentToEdit?.course {
                if let index = courseOptions.firstIndex(of: course) {
                    coursePickerView.selectRow(index, inComponent: 0, animated: false)
                }
            }
        }
    }
    
    func addToolbarToTextField(_ textField: UITextField?) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.items = [flexSpace, doneButton]
        textField?.inputAccessoryView = toolbar
    }
    
    func setupNavigationBar() {
        title = isEditMode ? "Edit Student" : "Add Student"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .systemBlue
    }
    
    func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        scrollView.contentInset.bottom = keyboardSize.height
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardSize.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = 0
        scrollView.verticalScrollIndicatorInsets.bottom = 0
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
    
    // MARK: - Data Operations
    
    func generateNextID() {
        let request: NSFetchRequest<Student> = Student.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: false)]
        request.fetchLimit = 1
        
        do {
            let lastStudent = try context.fetch(request).first
            let nextID = (lastStudent?.id ?? 0) + 1
            idTextField.text = "\(nextID)"
        } catch {
            print("Failed to generate ID: \(error)")
            idTextField.text = "1"
        }
    }
    
    func loadStudentData(_ student: StudentDisplayModel) {
        idTextField.text = "\(student.id)"
        nameTextField.text = student.name
        genderTextField.text = student.gender
        courseTextField.text = student.course
        enrollmentPicker.date = student.enrollment
    }
    
    func saveStudent() {
        // Validate inputs
        guard let idText = idTextField.text, !idText.isEmpty,
              let id = Int32(idText),
              let name = nameTextField.text, !name.isEmpty,
              let gender = genderTextField.text, !gender.isEmpty,
              let course = courseTextField.text, !course.isEmpty else {
            showAlert(message: "Please fill all fields")
            return
        }
        
        let enrollment = enrollmentPicker.date
        
        if isEditMode, let existingStudent = studentToEdit {
            // UPDATE - Find and update existing student
            let request: NSFetchRequest<Student> = Student.fetchRequest()
            request.predicate = NSPredicate(format: "id == %d", existingStudent.id)
            
            do {
                let results = try context.fetch(request)
                if let studentToUpdate = results.first {
                    studentToUpdate.name = name
                    studentToUpdate.gender = gender
                    studentToUpdate.course = course
                    studentToUpdate.enrollment = enrollment
                    
                    try context.save()
                    showAlert(message: "Student updated successfully!", isSuccess: true)
                    navigationController?.popViewController(animated: true)
                }
            } catch {
                print("Failed to update: \(error)")
                showAlert(message: "Failed to update student")
            }
        } else {
            // CREATE - Check if ID already exists
            let checkRequest: NSFetchRequest<Student> = Student.fetchRequest()
            checkRequest.predicate = NSPredicate(format: "id == %d", id)
            
            do {
                let existing = try context.fetch(checkRequest)
                if existing.first != nil {
                    showAlert(message: "Student with ID \(id) already exists!")
                    return
                }
            } catch {
                print("Failed to check ID: \(error)")
            }
            
            // Add new student
            let newStudent = Student(context: context)
            newStudent.id = id
            newStudent.name = name
            newStudent.gender = gender
            newStudent.course = course
            newStudent.enrollment = enrollment
            
            do {
                try context.save()
                showAlert(message: "Student added successfully!", isSuccess: true)
                navigationController?.popViewController(animated: true)
            } catch {
                print("Failed to save: \(error)")
                showAlert(message: "Failed to save student")
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        saveStudent()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func showAlert(message: String, isSuccess: Bool = false) {
        let alert = UIAlertController(title: isSuccess ? "Success" : "Notice", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - UIPickerView Delegate & DataSource
extension AddEditStudentViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return genderOptions.count
        } else {
            return courseOptions.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return genderOptions[row]
        } else {
            return courseOptions[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            genderTextField.text = genderOptions[row]
        } else {
            courseTextField.text = courseOptions[row]
        }
    }
}
