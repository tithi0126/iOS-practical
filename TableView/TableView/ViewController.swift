//
//  ViewController.swift
//  TableView
//
//  Created by Tithi Shah on 2/3/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let fruits = ["Apple"," Banana"," Mango", "Pineapple", "Grapes", "Mango", "Pineapple", "Grapes"]
    @IBOutlet var fruitTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fruitTable.dataSource = self
        fruitTable.delegate = self
        
        fruitTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }

}

