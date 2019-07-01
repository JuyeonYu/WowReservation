//
//  alamofire.swift
//  WowReservation
//
//  Created by 주연  유 on 01/07/2019.
//  Copyright © 2019 ucware. All rights reserved.
//

import Alamofire

struct AlamofireUtils {
    
    let tag: String
    let url: String
    let method: HTTPMethod
    let parameters: Parameters
    
    init(tag: String, path: String, method: HTTPMethod = .get, parameters: Parameters = [:]) {
        self.tag = tag
        url = path
        self.method = method
        self.parameters = parameters
    }
    
    //    func request(success: @escaping(_ data: String)-> Void, fail: @escaping (_ error: Error?)-> Void) {
    //        Alamofire.request(url, method: method, parameters: parameters).responseJSON { response in
    //            if response.result.isSuccess {
    //                success(String(data: response.result.value as! Data, encoding: .utf8)!)
    //            } else {
    //                fail(response.result.error)
    //            }
    //        }
    //    }
    
    func requestString(success: @escaping(_ tag: String, _ data: String?)-> Void, fail: @escaping (_ tag: String, _ error: Error?)-> Void) {
        Alamofire.request(url, method: method, parameters: parameters).responseString { response in
            if response.result.isSuccess {
                success(self.tag, response.result.value)
            } else {
                fail(self.tag, response.result.error)
            }
        }
    }
    
    
}
