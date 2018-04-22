//
//  Login.swift
//  Keystone
//
//  Created by Erika Pepe on 2018-04-20.
//  Copyright © 2018 Softchoice. All rights reserved.
//

import Foundation

class Login{
    var userId: Int?
    var firstName: String?
    var lastName: String?
    var companyId: Int?
    var companyName: String?
    
    init (userId:Int,firstName:String,lastName:String,companyId: Int, companyName: String) {
        self.userId = userId
        self.firstName = firstName
        self.lastName = lastName
        self.companyId = companyId
        self.companyName = companyName
    }
}
