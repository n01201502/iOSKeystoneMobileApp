//
//  TicketViewController.swift
//  Keystone
//
//  Created by Menat Pinesh I. on 4/18/18.
//  Copyright © 2018 Softchoice. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class TicketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var TicketView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let apiPostHttp = ApiHttpPostUtil()
//        apiPostHttp.postHttp(bodyParamenters: "operation=getTickets&company_id=1001"){ code in
//            print(code)
//        }
        
//        Alamofire.request("http://keystone.appsolution4u.com/keystone_android/keystoneWebService.php?operation=getTickets&company_id=1001", method: .post).validate().responseJSON { response in
//            switch response.result {
//            case .success:
//                print("Validation Successful")
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        let parameters:Parameters = [
            "operation":"getTickets",
            "company_id":"1001"
        ]
        
        Alamofire.request("http://keystone.appsolution4u.com/keystone_android/keystoneWebService.php", method: .post, parameters: parameters)
            .responseJSON { response in
                print(response)
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                if let result = response.result.value {
                    let JSON = result as! NSDictionary
                    print(JSON)
                }
                
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticket", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

}
