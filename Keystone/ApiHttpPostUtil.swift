//
//  ApiHttpPostUtil.swift
//  Keystone
//
//  Created by Adit Dhruv on 2018-04-18.
//  Copyright © 2018 Softchoice. All rights reserved.
//

import Foundation

class ApiHttpPostUtil {
    
    public func postHttp(bodyParamenters: String, completion: @escaping (NSString) -> ()){
        var dataString:NSString = ""
        let urlToRequest = "http://keystone.appsolution4u.com/keystone_android/keystoneWebService.php"
        let url4 = URL(string: urlToRequest)!
        let session4 = URLSession.shared
        let request = NSMutableURLRequest(url: url4)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        request.httpBody = bodyParamenters.data(using: String.Encoding.utf8)
        let task = session4.dataTask(with: request as URLRequest)
        { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                completion(dataString)
                return
            }
            dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)!
            completion(dataString)
        }
        task.resume()
    }
}
