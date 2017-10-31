//
//  WebserviceCall.swift
//  WeatherApp
//
//  Created by Bharti Sharma on 30/10/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation
import Alamofire

protocol WebserviceCall {
    func makeGETWebserviceCall(strURL:String, completionHandler:@escaping (_ jsonResponse:Any?, _ error: Error?)->Void)
}

extension WebserviceCall{
    
    func makeGETWebserviceCall(strURL:String, completionHandler:@escaping (_ jsonResponse:Any?, _ error: Error?)->Void){
     
        Alamofire.request(strURL).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let error = response.result.error {
                completionHandler(nil, error)
            }
            guard let jsonResponse = response.result.value else{
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data in string format: \(utf8Text)") // original server data as UTF8 string
                }
                completionHandler(nil, nil)
                return
            }
            print("JSON: \(jsonResponse)") // serialized json response
            completionHandler(jsonResponse, nil)
        }
    }
}
