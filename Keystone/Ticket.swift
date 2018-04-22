//
//  Ticket.swift
//  Keystone
//
//  Created by Menat Pinesh I. on 4/19/18.
//  Copyright © 2018 Softchoice. All rights reserved.
//

import Foundation

class Ticket{
    var ticket_id: String?
    var incident_type: String?
    var ticket_type: String?
    var ticket_priority: String?
    var ticket_description: String?
    var company_id: String?
    var ticket_class: String?
    var ticket_status: String?
    var ticket_reason: String?
    var ticket_requester: String?
    var ticket_category: String?
    var ticket_created_datetime: String?
    var device_id: String?
    
    init (ticket_id:String,incident_type:String,ticket_type:String,ticket_priority: String, ticket_description: String,company_id: String,ticket_class: String,
          ticket_status:String,ticket_reason:String,ticket_requester:String,ticket_category: String,ticket_created_datetime: String,device_id: String) {
        self.ticket_id = ticket_id
        self.incident_type = incident_type
        self.ticket_type = ticket_type
        self.ticket_priority = ticket_priority
        self.ticket_description = ticket_description
        self.company_id = company_id
        self.ticket_class = ticket_class
        self.ticket_status = ticket_status
        self.ticket_reason = ticket_reason
        self.ticket_requester = ticket_requester
        self.ticket_category = ticket_category
        self.ticket_created_datetime = ticket_created_datetime
        self.device_id = device_id
    }
//
//    required convenience init?(map: Map) {
//        self.init()
//    }
//
//    // Mappable
//    func mapping(map: Map) {
//        ticket_id               <- map["ticket_id"]
//        incident_type           <- map["incident_type"]
//        ticket_type             <- map["ticket_type"]
//        ticket_priority         <- map["ticket_priority"]
//        ticket_description      <- map["ticket_description"]
//        company_id              <- map["company_id"]
//        ticket_class            <- map["ticket_class"]
//        ticket_status           <- map["ticket_status"]
//        ticket_reason           <- map["ticket_reason"]
//        ticket_requester        <- map["ticket_requester"]
//        ticket_category         <- map["ticket_category"]
//        ticket_created_datetime <- (map["ticket_created_datetime"], DateTransform())
//        device_id               <- map["device_id"]
//    }
}
