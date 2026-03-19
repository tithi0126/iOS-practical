//
//  ViewController.swift
//  Animation
//
//  Created by Tithi Shah on 2/11/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
            func imageViewAnimation() {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            imageView.center = view.center
            imageView.image = UIImage(named: "image")
            view.addSubview(imageView)
        }
        imageViewAnimation()
    }


}

