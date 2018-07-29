//
//  Address.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Address {
    var id: Int
    var district: District
    var street: String
    var neighborhood: String
    var complement: String
    var number: String
    var status: String
    
    public init() {
        self.id = 0
        self.district = District.init()
        self.street = ""
        self.neighborhood = ""
        self.complement = ""
        self.number = ""
        self.status = ""
    }
    
    public init(id: Int, district: District, street: String, neighborhood: String, complement: String, number: String, status: String) {
        self.id = id
        self.district = district
        self.street = street
        self.neighborhood = neighborhood
        self.complement = complement
        self.number = number
        self.status = status
    }
    
    public convenience init (fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  district: District.init(fromJSONObject: jsonObject["district"]),
                  street: jsonObject["street"].stringValue,
                  neighborhood: jsonObject["neighborhood"].stringValue,
                  complement: jsonObject["complement"].stringValue,
                  number: jsonObject["number"].stringValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Address] {
        var modelList = [Address]()
        let count = jsonArray.count
        for i in 0..<count {
            modelList.append(Address.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
