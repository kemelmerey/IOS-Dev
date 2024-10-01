//
//  ViewController.swift
//  I_am_rich
//
//  Created by Kemel Merey on 25.09.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func changeColorButtonTapped(_ sender: UIButton) {
        let red = CGFloat(arc4random_uniform(256)) / 255.0
        let green = CGFloat(arc4random_uniform(256)) / 255.0
        let blue = CGFloat(arc4random_uniform(256)) / 255.0
        
        self.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }


}



