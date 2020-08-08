//
//  ServiceCall.swift
//
//
//

import Foundation

typealias SuccessBlock = (Any?, Any?) -> Void
typealias FailureBlock = (Error?, Any?) -> Void

class ServiceCallClass: NSObject {
    
    static let sharedInstance = ServiceCallClass()
    //Initializer access level change now
    private override init(){}
    
    func serviceCallForGetCourseList(methodType:HTTPMethod, urlString: String, onSuccess: @escaping SuccessBlock, onError: @escaping FailureBlock) {
        
        let req = RequestMakerClass.createRequest(methodType: .GET, urlString: "")
        NetworkManagerClass.sharedInstance.performAPICall(urlRequest: req, urlString: urlString, param: "", block: { (data, urlResponse, error) in
            
        })
        
    }
    
    
    ///
    /// - Parameter respData:
    /// - Returns:
    func getDictResponse(respData:Data) -> Dictionary <String, Any>? {
        
        do {
            let response = try JSONSerialization.jsonObject(with: respData , options: .allowFragments)
            return response as? Dictionary<String, Any>
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    }
