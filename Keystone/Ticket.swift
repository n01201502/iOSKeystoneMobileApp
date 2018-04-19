//
//  Ticket.swift
//  Keystone
//
//  Created by Menat Pinesh I. on 4/19/18.
//  Copyright © 2018 Softchoice. All rights reserved.
//

import Foundation
import ObjectMapper

class Ticket{
    var ticket_id: Int?
    var incident_type: Int?
    var ticket_type: String?
    var ticket_priority: String?
    var ticket_description: String?
    var company_id: Int?
    var ticket_class: String?
    var ticket_status: String?
    var ticket_reason: String?
    var ticket_requester: String?
    var ticket_category: String?
    var ticket_created_datetime: Date?
    var device_id: Int?
    
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        ticket_id               <- map["ticket_id"]
        incident_type           <- map["incident_type"]
        ticket_type             <- map["ticket_type"]
        ticket_priority         <- map["ticket_priority"]
        ticket_description      <- map["ticket_description"]
        company_id              <- map["company_id"]
        ticket_class            <- map["ticket_class"]
        ticket_status           <- map["ticket_status"]
        ticket_reason           <- map["ticket_reason"]
        ticket_requester        <- map["ticket_requester"]
        ticket_category         <- map["ticket_category"]
        ticket_created_datetime <- (map["ticket_created_datetime"], DateTransform())
        device_id               <- map["device_id"]
    }
}
