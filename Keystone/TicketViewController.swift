//
//  TicketViewController.swift
//  Keystone
//
//  Created by Menat Pinesh I. on 4/18/18.
//  Copyright © 2018 Softchoice. All rights reserved.
//

import UIKit

class TicketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var TicketView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiPostHttp = ApiHttpPostUtil()
        apiPostHttp.postHttp(bodyParamenters: "operation=getTickets&company_id=1001"){ code in
            print(code)
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
