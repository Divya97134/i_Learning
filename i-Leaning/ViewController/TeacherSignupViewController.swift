//
//  TeacherSignupViewController.swift
//  i-Leaning
//
//  Created by Divya shrivastava on 8/8/20.
//

import UIKit

class TeacherSignupViewController: UIViewController,UITextFieldDelegate {

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
    
    
    @IBAction func tapOndone(_ sender: Any) {
       
        self.txtName.text = self.txtName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if self.txtName.text == "" {
            self.showAlert(msg: "Please enter your name")
            return
        }
        else if self.txtEmail.text == "" {
            self.showAlert(msg: "Please enter your email")
            return
        }
        else if self.txtPassword.text == "" {
            self.showAlert(msg: "Please enter your password")
            return
        }
        else if arrSelectedCourseList == nil {
            self.showAlert(msg: "Please choose your course type")
            return
        }
        
        
        let detailobj:TeacherDetail = TeacherDetail.init(name: self.txtName.text ?? "", email: self.txtEmail.text ?? "", password: self.txtPassword.text ?? "", courseList: self.arrSelectedCourseList! )
      
        // fetching data from server
        
//        ServiceCallClass.sharedInstance.serviceCallForGetCourseList(methodType: .GET, urlString: "") { (resp, data) in
//
//        } onError: { (error, resp) in
//
//        }

        self.performSegue(withIdentifier: "Detail", sender: detailobj)
        
    }
    //delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true

    }
    // MARK: - Navigation}

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let objDetail:TeacherDetail = sender as! TeacherDetail
        let vcobj = segue.destination as! TeacherHomeViewController
        vcobj.teacherDetail = objDetail
    }
    
    func showAlert(msg:String) {
           let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)

           alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (_) in
               print("You've pressed default")
           }))
        self.present(alert, animated: true, completion: nil)

    }
    
    @IBAction func tapOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
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
    

