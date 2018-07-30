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
    //MARK: List Relationships
    var doctors: [Doctor]
    
    public init() {
        self.id = 0
        self.doctors = []
        self.district = District.init()
        self.street = ""
        self.neighborhood = ""
        self.complement = ""
        self.number = ""
        self.status = "ACT"
    }
    
    public init(id: Int, doctors: [Doctor]?, district: District, street: String?, neighborhood: String?, complement: String?, number: String?, status: String?) {
        self.id = id
        self.doctors = (doctors == nil) ? [] : doctors!
        self.district = district
        self.street = (street == nil) ? "" : street!
        self.neighborhood = (neighborhood == nil) ? "" : neighborhood!
        self.complement = (complement == nil) ? "" : complement!
        self.number = (number == nil) ? "" : number!
        self.status = (status == nil) ? "" : status!
    }
    
    public convenience init (fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  doctors: Doctor.buildCollection(fromJSONArray: jsonObject["doctors"].arrayValue),
                  district: District.init(fromJSONObject: jsonObject["district"]),
                  street: jsonObject["street"].stringValue,
                  neighborhood: jsonObject["neighborhood"].stringValue,
                  complement: jsonObject["complement"].stringValue,
                  number: jsonObject["number"].stringValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Address] {
        var modelList = [Address]()
        for i in 0..<jsonArray.count {
            modelList.append(Address.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
