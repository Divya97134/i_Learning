//
//  UtilityClaass.swift
//  BottlelRocket
//
//  Created by Divya shrivastava on 7/31/20.
//

import Foundation
import UIKit

class Utility {
    
static func showMessage(title: String, msg: String) {
    DispatchQueue.main.async {

    let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
    UIApplication.shared.inputViewController?.present(alert, animated:true, completion:nil)
    }
}
}
