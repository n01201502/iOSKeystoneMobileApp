//
//  ContactViewController.swift
//  Keystone
//
//  Created by Erika Pepe on 2018-04-20.
//  Copyright © 2018 Softchoice. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func phoneCallBtn(_ sender: Any) {
        let url:NSURL = URL(string: "TEL://6476750064")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
}
