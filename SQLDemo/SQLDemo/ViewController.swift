import UIKit
import SQLite3

struct Employee {
    var id: Int
    var name: String
    var age: Int
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ageTf: UITextField!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var idTf: UITextField!
    @IBOutlet weak var table: UITableView!
    
    let dbName = "myDb.sqlite"
    var db: OpaquePointer?
    var list = [Employee]()

    override func viewDidLoad() {
        super.viewDidLoad()
        db = openDB()
        createTable()
        loadData()
    }

    func loadData() {
        list = read()
        table.reloadData()
    }

    // MARK: - IBActions
    @IBAction func onAdd(_ sender: UIButton) {
        let id = Int(idTf.text!) ?? 0
        let name = nameTf.text!
        let age = Int(ageTf.text!) ?? 0
        
        insert(id: id, name: name, age: age)
        list.append(Employee(id: id, name: name, age: age))
        
        idTf.text = ""
        nameTf.text = ""
        ageTf.text = ""
        table.reloadData()
    }

    // MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let emp = list[indexPath.row]
        cell.textLabel?.text = emp.name
        cell.detailTextLabel?.text = "ID: \(emp.id) | Age: \(emp.age)"
        return cell
    }

    // MARK: - Database Logic
    func openDB() -> OpaquePointer? {
        let url = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbName)
        
        var db: OpaquePointer?
        if sqlite3_open(url.path, &db) != SQLITE_OK {
            print("Error opening DB")
            return nil
        }
        print("DB opened at \(url.path)")
        return db
    }

    func createTable() {
        let sql = "CREATE TABLE IF NOT EXISTS person(Id INTEGER PRIMARY KEY, name TEXT, age INTEGER);"
        var stmt: OpaquePointer?
        if sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK {
            if sqlite3_step(stmt) == SQLITE_DONE {
                print("Table created.")
            }
        }
        sqlite3_finalize(stmt)
    }

    func insert(id: Int, name: String, age: Int) {
        let sql = "INSERT INTO person (Id, name, age) VALUES (?, ?, ?);"
        var stmt: OpaquePointer?
        if sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK {
            sqlite3_bind_int(stmt, 1, Int32(id))
            sqlite3_bind_text(stmt, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(stmt, 3, Int32(age))
            
            if sqlite3_step(stmt) != SQLITE_DONE {
                print("Insert failed.")
            }
        }
        sqlite3_finalize(stmt)
    }

    func read() -> [Employee] {
        let sql = "SELECT * FROM person;"
        var stmt: OpaquePointer?
        var emps = [Employee]()
        
        if sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK {
            while sqlite3_step(stmt) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(stmt, 0))
                let name = String(cString: sqlite3_column_text(stmt, 1))
                let age = Int(sqlite3_column_int(stmt, 2))
                emps.append(Employee(id: id, name: name, age: age))
            }
        }
        sqlite3_finalize(stmt)
        return emps
    }
}

