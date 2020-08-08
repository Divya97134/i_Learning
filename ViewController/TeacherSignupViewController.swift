//
//  TeacherSignupViewController.swift
//  i-Leaning
//
//  Created by Divya shrivastava on 8/8/20.
//

import UIKit

class TeacherSignupViewController: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var arrCourseList :Array<String>?
    var arrSelectedCourseList :Array<String>?

    override func viewDidLoad() {
        super.viewDidLoad()
        arrCourseList = Array()
        arrCourseList  = ["Science", "Math", "English"]
        
        arrSelectedCourseList = Array()
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


extension TeacherSignupViewController:UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCourseList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCourse", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = arrCourseList?[indexPath.row];
        return cell
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
       // print(cell.textLabel?.text)
        let courseName = cell.textLabel?.text
        if (cell.accessoryType == .none) {
            cell.accessoryType = .checkmark
            arrSelectedCourseList?.append(courseName ?? "")
        }
        else {
            cell.accessoryType = .none
            if let index = arrSelectedCourseList?.firstIndex(of:courseName ?? "") {
                arrSelectedCourseList?.remove(at: index)
            }
        }
    }
   
}
    

