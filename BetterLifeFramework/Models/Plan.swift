//
//  Plan.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Plan {
    var id: Int
    var name: String
    var shortName: String
    var description: String
    var acceptedPatient: Int
    var price: Float
    
    public init() {
        self.id = 0
        self.name = ""
        self.shortName = ""
        self.description = ""
        self.acceptedPatient = 0
        self.price = 0.0000
    }
    
    public init(id: Int, name: String, shortName: String, description: String, acceptedPatient: Int, price: Float) {
        self.id = id
        self.name = name
        self.shortName = shortName
        self.description = description
        self.acceptedPatient = acceptedPatient
        self.price = price
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  name: jsonObject["name"].stringValue,
                  shortName: jsonObject["shortName"].stringValue,
                  description: jsonObject["description"].stringValue,
                  acceptedPatient: jsonObject["acceptedPatient"].intValue,
                  price: jsonObject["price"].floatValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Plan] {
        var modelList = [Plan]()
        let count = jsonArray.count
        for i in 0..<count {
            modelList.append(Plan.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
