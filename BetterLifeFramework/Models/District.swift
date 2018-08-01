//
//  District.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

public class District {
    var id: Int
    var name: String
    var shortName: String
    
    public init() {
        self.id = 0
        self.name = ""
        self.shortName = ""
    }
    
    public init(id: Int, name: String, shortName: String) {
        self.id = id
        self.name = name
        self.shortName = shortName
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  name: jsonObject["name"].stringValue,
                  shortName: jsonObject["shortName"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [District] {
        var modelList = [District]()
        for i in 0..<jsonArray.count {
            modelList.append(District.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
