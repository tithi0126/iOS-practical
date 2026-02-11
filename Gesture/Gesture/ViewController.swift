//
//  ViewController.swift
//  Gesture
//
//  Created by Tithi Shah on 2/4/26.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var longpress: UILongPressGestureRecognizer!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lable1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        imagefesture(<#UILongPressGestureRecognizer#>)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func imagefesture(_ sender: UILongPressGestureRecognizer) {
        
        lable1.text = "Long Press"
    }

    @IBAction func rotationGesture(_ sender: UIRotationGestureRecognizer) {
        
        imageView.transform = imageView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    @IBAction func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        
        imageView.transform = imageView.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
//    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
//        let translation = sender.translation(in: self.view)
//        if let drag = sender.view {
//            
//        }
//    }
    
}

