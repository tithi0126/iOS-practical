//
//  ViewController.swift
//  StoryboardTest
//
//  Created by Tithi Shah on 1/27/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var taskField: UITextField!
    @IBOutlet  var taskButton: UIButton!
    @IBOutlet  var taskLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var task: String = ""
//    Mask:- Button Events
    @IBAction func addTaskClick(_ sender: UIButton) {
        task = taskField.text ?? ""
        
        
//        taskLabel.text = task + (taskField.text ?? "")
    
    }
   
}

