//
//  NetworkManagerClass.swift
//  RequestMakerClass.swift
//  i-Leaning
//
//  Created by Divya shrivastava on 8/8/20.

import UIKit

class NetworkManagerClass: NSObject,URLSessionDelegate {

    typealias CompletionBlock = (AnyObject?,HTTPURLResponse?, Error?) -> Void
    
    static let sharedInstance = NetworkManagerClass()
    //Initializer access level change now
    private override init(){}
    
    func networkCall(urlRequest:URLRequest,block:@escaping CompletionBlock)  {
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession.init(configuration: sessionConfiguration, delegate: self as URLSessionDelegate, delegateQueue: nil)
        let dataTask = session.dataTask(with: urlRequest) { (data, urlResponse, error) in
            block(data as AnyObject,urlResponse as? HTTPURLResponse,error)
        }
        dataTask.resume()
    }
    func performAPICall(urlRequest:URLRequest?, urlString:String, param:Any, block:@escaping CompletionBlock) {
        
        if urlRequest != nil {
            networkCall(urlRequest: urlRequest!) { (data, urlResponse, error) in
                if nil != error {
                   // Utility.showMessage(title:"Error",msg:error!.localizedDescription)
                    block(nil,nil, error)
                    
                }
                else
                {
                    if let urlResponsecode = urlResponse //, urlResponsecode.statusCode == 200//,  urlResponsecode.statusCode == 201
                    {
                        block(data as AnyObject,urlResponsecode,nil)
                    }
                }
            }
        }
        else {
          //  ProgressHUD.hide(<#T##self: ProgressHUD##ProgressHUD#>)()
        }
    }
}


