import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var textData: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var tableView: UITableView!

    var items: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // Set up text field delegate to dismiss keyboard
        textData.delegate = self
        
        // Add tap gesture to dismiss keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        // Configure text field to minimize haptic interactions
        configureTextField()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func configureTextField() {
        // Disable input assistant items (might reduce haptic triggers)
        textData.autocorrectionType = .no
        textData.spellCheckingType = .no
        textData.smartQuotesType = .no
        textData.smartDashesType = .no
        
        if #available(iOS 11.0, *) {
            textData.smartInsertDeleteType = .no
        }
    }

    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let text = textData.text, !text.isEmpty else { return }

        items.append(text)
        textData.text = ""
        
        // Dismiss keyboard after adding
        dismissKeyboard()
        
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    // MARK: - Delete (Swipe to Delete)

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
