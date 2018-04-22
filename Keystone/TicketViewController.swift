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
    var tickets = [Ticket]()
    
    override func viewDidLoad() {
        TicketView.delegate = nil
        TicketView.dataSource = nil
         
        super.viewDidLoad()
        
        let parameters:Parameters = [
            "operation":"getTickets",
            "company_id":"1001"
        ]
        
        Alamofire.request("http://keystone.appsolution4u.com/keystone_android/keystoneWebService.php", method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        print("example success")
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
                                    for listTicket in (dataarray as? NSArray)! {
                                        //print(singleTicket)
                                        if let singleTicket = listTicket as? [String: Any] {
                                            self.tickets.append(Ticket(ticket_id:singleTicket["ticket_id"] as! String,
                                                                  incident_type: singleTicket["incident_type"] as! String,
                                                                  ticket_type: singleTicket["ticket_type"] as! String,
                                                                  ticket_priority: singleTicket["ticket_priority"] as! String,
                                                                  ticket_description: singleTicket["ticket_description"] as! String,
                                                                  company_id: singleTicket["company_id"] as! String,
                                                                  ticket_class: singleTicket["ticket_class"] as! String,
                                                                  ticket_status: singleTicket["ticket_status"] as! String,
                                                                  ticket_reason: singleTicket["ticket_reason"] as! String,
                                                                  ticket_requester: singleTicket["ticket_requester"] as! String,
                                                                  ticket_category: singleTicket["ticket_category"] as! String,
                                                                  ticket_created_datetime: singleTicket["ticket_created_datetime"] as! String,
                                                                  device_id: singleTicket["device_id"] as! String
                                                                  ))
                                        }
                                        print("----------" + String(self.tickets.count))
                                        self.TicketView.delegate = self
                                        self.TicketView.dataSource = self
                                        //print("------------------------------")
                                    }
                                }
                            }
                        }
                    }
                    
                }
                
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticket", for: indexPath) as! TicketViewCell
        cell.ticket_id.text = tickets[indexPath.row].incident_type! + "-" + tickets[indexPath.row].ticket_id!
        cell.ticket_status.text = tickets[indexPath.row].ticket_status!
        cell.ticket_date.text = tickets[indexPath.row].ticket_created_datetime!
        cell.ticket_priority.text = tickets[indexPath.row].ticket_priority!
        
        cell.ticket_description.text = tickets[indexPath.row].ticket_description!
        
        let origImage = UIImage(named: "ic_status")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        cell.status_btn.image = tintedImage
        cell.status_btn.tintColor = .orange
        
        let origImage1 = UIImage(named: "ic_priority")
        let tintedImage1 = origImage1?.withRenderingMode(.alwaysTemplate)
        cell.priority_btn.image = tintedImage1
        cell.priority_btn.tintColor = .orange
        
        let origImage2 = UIImage(named: "ic_date")
        let tintedImage2 = origImage2?.withRenderingMode(.alwaysTemplate)
        cell.date_btn.image = tintedImage2
        cell.date_btn.tintColor = .orange
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tickets.count
    }
    
}
