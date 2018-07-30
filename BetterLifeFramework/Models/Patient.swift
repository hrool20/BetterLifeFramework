//
//  Patient.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Patient {
    var id: Int
    var user: User
    var plan: Plan
    var age: Int
    var bloodType: String
    var weight: Float
    var sex: String
    var height: Float
    var status: String
    
    public init() {
        self.id = 0
        self.user = User.init()
        self.plan = Plan.init()
        self.age = 0
        self.bloodType = ""
        self.weight = 0.0000
        self.sex = ""
        self.height = 0.0000
        self.status = "ACT"
    }
    
    public init(id: Int, user: User, plan: Plan, age: Int, bloodType: String?, weight: Float?, sex: String?, height: Float?, status: String?) {
        self.id = id
        self.user = user
        self.plan = plan
        self.age = age
        self.bloodType = (bloodType == nil) ? "" : bloodType!
        self.weight = (weight == nil) ? 0.0000 : weight!
        self.sex = (sex == nil) ? "" : sex!
        self.height = (height == nil) ? 0.0000 : height!
        self.status = (status == nil) ? "" : status!
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  user: User.init(fromJSONObject: jsonObject["user"]),
                  plan: Plan.init(fromJSONObject: jsonObject["plan"]),
                  age: jsonObject["age"].intValue,
                  bloodType: jsonObject["bloodType"].stringValue,
                  weight: jsonObject["weight"].floatValue,
                  sex: jsonObject["sex"].stringValue,
                  height: jsonObject["height"].floatValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Patient] {
        var modelList = [Patient]()
        for i in 0..<jsonArray.count {
            modelList.append(Patient.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
