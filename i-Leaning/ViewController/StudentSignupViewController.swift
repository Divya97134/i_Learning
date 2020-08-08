//
//  StudentSignupViewController.swift
//  i-Leaning
//
//  Created by Divya shrivastava on 8/8/20.
//

import UIKit

class StudentSignupViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var arrSubjectList :Array<String>?
    var arrSelectedSubjectList :Array<String>?
    override func viewDidLoad() {
        super.viewDidLoad()
        arrSubjectList  = ["Science", "Math", "English"]
        arrSelectedSubjectList = Array()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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

extension StudentSignupViewController:UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSubjectList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSubject", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = arrSubjectList?[indexPath.row];
        return cell
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
       // print(cell.textLabel?.text)
        let SubjectName = cell.textLabel?.text
        if (cell.accessoryType == .none) {
            cell.accessoryType = .checkmark
            arrSelectedSubjectList?.append(SubjectName ?? "")
        }
        else {
            cell.accessoryType = .none
            if let index = arrSelectedSubjectList?.firstIndex(of:SubjectName ?? "") {
                arrSelectedSubjectList?.remove(at: index)
            }
        }
    }
   
}
