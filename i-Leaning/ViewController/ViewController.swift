//
//  ViewController.swift
//  i-Leaning
//
//  Created by Divya shrivastava on 8/8/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapOnTeacher(_ sender: Any) {
        self.performSegue(withIdentifier: "SegueTeacher", sender: nil)
    }
    
    @IBAction func tapOnStudent(_ sender: Any) {
    }
    
    
    
}

