//
//  Doctor.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Doctor {
    var id: Int
    var user: User
    var plan: Plan
    var address: Address
    var doctorIdentification: String
    var status: String
    
    public init() {
        self.id = 0
        self.user = User.init()
        self.plan = Plan.init()
        self.address = Address.init()
        self.doctorIdentification = ""
        self.status = ""
    }
    
    public init(id: Int, user: User, plan: Plan, address: Address, doctorIdentification: String, status: String) {
        self.id = id
        self.user = user
        self.plan = plan
        self.address = address
        self.doctorIdentification = doctorIdentification
        self.status = status
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  user: User.init(fromJSONObject: jsonObject["user"]),
                  plan: Plan.init(fromJSONObject: jsonObject["plan"]),
                  address: Address.init(fromJSONObject: jsonObject["address"]),
                  doctorIdentification: jsonObject["doctorIdentification"].stringValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Doctor] {
        var modelList = [Doctor]()
        let count = jsonArray.count
        for i in 0..<count {
            modelList.append(Doctor.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
