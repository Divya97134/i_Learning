//
//  TeacherHomeViewController.swift
//  i-Leaning
//
//  Created by Divya shrivastava on 8/8/20.
//

import UIKit

class TeacherHomeViewController: UIViewController {
 
    var teacherDetail:TeacherDetail?
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblEmail: UILabel!

    @IBOutlet var lblCourse: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblName.text = teacherDetail?.name
        self.lblEmail.text = teacherDetail?.email
        // Do any additional setup after loading the view.
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
