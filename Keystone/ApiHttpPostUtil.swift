//
//  ApiHttpPostUtil.swift
//  Keystone
//
//  Created by Adit Dhruv on 2018-04-18.
//  Copyright © 2018 Softchoice. All rights reserved.
//

import Foundation

class ApiHttpPostUtil {
    var dataString:NSString = ""
    
    public func postHttp(bodyParamenters: String) -> NSString{
        
        func dataRequest() {
            let urlToRequest = "http://keystone.appsolution4u.com/keystone_android/keystoneWebService.php"
            let url4 = URL(string: urlToRequest)!
            let session4 = URLSession.shared
            let request = NSMutableURLRequest(url: url4)
            request.httpMethod = "POST"
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
            request.httpBody = bodyParamenters.data(using: String.Encoding.utf8)
            let task = session4.dataTask(with: request as URLRequest) { (data, response, error) in
                guard let _: Data = data, let _: URLResponse = response, error == nil else {
                    print("*****error")
                    return
                }
                self.dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                //print(self.dataString)
            }
            task.resume()
        }
        dataRequest()
        return self.dataString
    }
}
