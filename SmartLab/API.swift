//
//  API.swift
//  SmartLab
//
//  Created by maika on 12/2/19.
//  Copyright © 2019 maika. All rights reserved.
//

import Alamofire
//import SwiftyJSON
import ObjectMapper


final class API{
    static func getEvent(onSuccess: @escaping (_ events: [Event]) -> Void,onError: @escaping (_ error:Error) -> Void){
        Alamofire.request("https://smart-lab.getsandbox.com/search/individual").responseJSON{(responseData) -> Void in
            if let error = responseData.error{
                onError(error)
                return
            }
            guard let json = responseData.result.value as? [String:Any] else{
                onError(NSError.init(domain: "data not found", code: 1, userInfo: nil))
                return
            }
            let results = Mapper<Result>().map(JSON: json)
            onSuccess(results!.events)
        }
        
    }
    
    static func getCell(onSuccess: @escaping (_ event2:[Event2] ) -> Void,onError: @escaping (_ error:Error) -> Void){
        Alamofire.request("https://smart-lab.getsandbox.com/search/package").responseJSON{(responseData) -> Void in
            if let error = responseData.error{
                onError(error)
                return
            }
            guard let json2 = responseData.result.value as? [String:Any] else {
                onError(NSError.init(domain: "data not found", code: 1, userInfo: nil))
                return
            }
            let results2 = Mapper<Result2>().map(JSON: json2)
            onSuccess(results2!.events2)
        }
    }
}

