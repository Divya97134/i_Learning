//
//  RequestMakerClass.swift
//  i-Leaning
//
//  Created by Divya shrivastava on 8/8/20.

import UIKit

class RequestMakerClass: NSObject {

    
    /// create url
    ///
    /// - Parameters:
    ///   - methodType:
    ///   - urlString: url as string
    /// - Returns: URL
    class func createURL(methodType:HTTPMethod, urlString:String) -> URL? {
        var urlreqj:URL?
        switch methodType {
        case .GET:
         //   let url : NSString = "" as NSString
          
            let urlStr : NSString = urlString.addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed)! as NSString
            urlreqj = URL(string: urlStr as String)
            print(urlreqj ?? "")
         
            break
        }
        return urlreqj
    }
    
    /// Create a request for all API
    ///
    /// - Parameters:
    ///   - methodType:
    ///   - urlString:
    ///   - param:
    /// - Returns:
        class func createRequest(methodType:HTTPMethod, urlString:String) -> URLRequest?  {
        var request:URLRequest?

        let requestUrl = createURL(methodType: methodType, urlString: urlString)
        if (requestUrl == nil)  {
            return nil
        }
        request = URLRequest.init(url:requestUrl!)
        request = createMethodType(urlRequest: &request!, methodType: methodType)
        request?.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
        }
 
    ///  creating method type for request
    ///
    /// - Parameters:
    ///   - urlRequest:
    ///   - methodType:
    ///   - param:
    ///   - authUrl:
    /// - Returns:
        
    class private func createMethodType( urlRequest:inout URLRequest, methodType:HTTPMethod)
        -> URLRequest  {
            
            var request:URLRequest = urlRequest as URLRequest
            request.httpBody = nil
            switch methodType {
            case .GET:
                request.httpMethod = HTTPMethod.GET.rawValue
                break
            }
            return request
    }
}



