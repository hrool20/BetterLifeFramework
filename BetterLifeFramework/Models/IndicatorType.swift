//
//  IndicatorType.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class IndicatorType {
    var id: Int
    var unitOfMeasure: UnitOfMeasure
    var name: String
    var shortName: String
    
    public init() {
        self.id = 0
        self.unitOfMeasure = UnitOfMeasure.init()
        self.name = ""
        self.shortName = ""
    }
    
    public init(id: Int, unitOfMeasure: UnitOfMeasure, name: String, shortName: String) {
        self.id = id
        self.unitOfMeasure = unitOfMeasure
        self.name = name
        self.shortName = shortName
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  unitOfMeasure: UnitOfMeasure.init(fromJSONObject: jsonObject["unitOfMeasure"]),
                  name: jsonObject["name"].stringValue,
                  shortName: jsonObject["shortName"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [IndicatorType] {
        var modelList = [IndicatorType]()
        let count = jsonArray.count
        for i in 0..<count {
            modelList.append(IndicatorType.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
