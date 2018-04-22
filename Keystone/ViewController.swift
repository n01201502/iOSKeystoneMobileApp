//
//  ViewController.swift
//  Keystone
//
//  Created by Adit Dhruv on 2018-04-04.
//  Copyright © 2018 Softchoice. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var linkForgot: UITextView!
    
    var login = [Login]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAuthorization(_ sender: UIButton) {
        
        if (userName.text == "" || passWord.text == "") {
            //
        } else {
            
            let parameters:Parameters = [
                "operation":"loginAuthentication",
                "username":userName,
                "password":passWord
            ]
            
            Alamofire.request("http://keystone.appsolution4u.com/keystone_android/keystoneWebService.php", method: .post, parameters: parameters)
                .responseJSON { response in
                    //to get status code
                    if let status = response.response?.statusCode {
                        switch(status){
                        case 200:
                            print("Login success!")
                        default:
                            print("error with response status: \(status)")
                        }
                    }
                    //to get JSON return value
                    if let result = response.result.value {
                        if let JSON = result as? NSDictionary {
                            if let data = JSON["success"] {
                                if(data as! Bool == true) {
                                    //print(data)
                                    if let dataarray = JSON["data"] {
                                        //print(dataarray)
                                        for listLogin in (dataarray as? NSArray)! {
                                            //print(singleTicket)
                                            if let loginInfo = listLogin as? [String: Any] {
                                                self.login.append(Login(userId:loginInfo["userId"] as! Int,
                                                                        firstName: loginInfo["firstName"] as! String,
                                                                        lastName: loginInfo["lastName"] as! String,
                                                                        companyId: loginInfo["companyId"] as! Int,
                                                                        companyName: loginInfo["companyName"] as! String
                                                ))
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
            }
        }

    
    }
    
}

