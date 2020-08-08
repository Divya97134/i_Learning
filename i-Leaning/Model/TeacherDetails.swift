//
//  TeacherDetails.swift
//  i-Leaning
//
//  Created by Divya shrivastava on 8/8/20.
//

import UIKit

class TeacherDetail {
    
    let name: String?
    let email:String?
    let password:String?
    let courseList :Array<String>
    
    init(name:String,email:String, password:String, courseList:Array<String>) {
        self.name = name
        self.email = email
        self.courseList = courseList
        self.password = password
    }
}

