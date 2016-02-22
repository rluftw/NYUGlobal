//
//  NYUAPI.swift
//  NYUGlobal
//
//  Created by Xing Hui Lu on 2/20/16.
//  Copyright © 2016 Xing Hui Lu. All rights reserved.
//

import Foundation

class NYUAPI {
    
    class func sharedInstance() -> NYUAPI {
        struct Singleton {
            static let api = NYUAPI()
        }
        
        return Singleton.api
    }
    
    func getHalls(completionHandler: (Bool, [String]!, NSError?) -> Void) {
        NetworkRequests.sharedInstance().httpGETRequest("https://housing.nyu.edu/api/nyuapirooms/City/New-York") { (success, result, error) -> Void in
            if success {
                let halls = NSSet(array: result)
                let hallsArray = halls.map({ (hall) -> String in
                    return (hall as! String)
                })
                                
                completionHandler(success, hallsArray, error)
            }
            
            completionHandler(success, result, error)
            
        }
    }
    
}