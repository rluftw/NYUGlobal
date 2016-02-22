//
//  NetworkRequests.swift
//  NYUGlobal
//
//  Created by Xing Hui Lu on 2/20/16.
//  Copyright © 2016 Xing Hui Lu. All rights reserved.
//

import Foundation

class NetworkRequests {
    let session = NSURLSession.sharedSession()
    
    class func sharedInstance() -> NetworkRequests {
        struct Singleton {
            static let networkRequest = NetworkRequests()
        }
        return Singleton.networkRequest
    }
    
    func httpGETRequest(urlString: String, completionHandler: (success: Bool, result: [String]!, error: NSError?) -> Void) {
        guard let url = NSURL(string: urlString) else {
            return
        }
        let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            guard error == nil else {
                print("Error with the request")
                var userInfo = [String: AnyObject]()
                userInfo[NSLocalizedDescriptionKey] = "Error with the request"
                let error = NSError(domain: "GetRequest", code: 1, userInfo: userInfo)
                completionHandler(success: false, result: nil, error: error)

                return
            }
            
            guard let unwrappedData = data where data != nil else {
                print("No data returned")
                var userInfo = [String: AnyObject]()
                userInfo[NSLocalizedDescriptionKey] = "No data returned"
                let error = NSError(domain: "GetRequest", code: 2, userInfo: userInfo)
                completionHandler(success: false, result: nil, error: error)
                
                return
            }
            
            guard let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode >= 200 && statusCode <= 299 else {
                print("Invalid status code")
                var userInfo = [String: AnyObject]()
                userInfo[NSLocalizedDescriptionKey] = "Invalid status code"
                let error = NSError(domain: "GetRequest", code: 3, userInfo: userInfo)
                completionHandler(success: false, result: nil, error: error)
                
                return
            }

            let result = self.parseResults(unwrappedData)
            
            completionHandler(success: true, result: result, error: nil)
        }
        
        task.resume()
    }
}

extension NetworkRequests {
    func parseResults(data: NSData) -> [String] {
        
        var json: AnyObject!
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
        } catch {
            print("Horribly formatted json response")
            
            return [String]()
        }
        
        guard let allRoomsResults = json as? [[String: AnyObject]] else {
            print("NO good")
            
            return [String]()
        }
        
        let results = allRoomsResults.map { (room) -> String in
            return room["HallName"] as! String
        }
        
        return results
    }
}