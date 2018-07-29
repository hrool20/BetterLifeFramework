//
//  Device.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Device {
    var id: Int
    var user: User
    var ip: String
    
    public init() {
        self.id = 0
        self.user = User.init()
        self.ip = ""
    }
    
    public init(id: Int, user: User, ip: String) {
        self.id = id
        self.user = user
        self.ip = ip
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  user: User.init(fromJSONObject: jsonObject["user"]),
                  ip: jsonObject["ip"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Device] {
        var modelList = [Device]()
        let count = jsonArray.count
        for i in 0..<count {
            modelList.append(Device.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
