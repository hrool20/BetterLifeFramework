//
//  IndicatorEntry.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class IndicatorEntry {
    var id: Int
    var indicator: Indicator
    var value: String
    
    public init() {
        self.id = 0
        self.indicator = Indicator.init()
        self.value = ""
    }
    
    public init(id: Int, indicator: Indicator, value: String?) {
        self.id = id
        self.indicator = indicator
        self.value = (value == nil) ? "" : value!
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  indicator: Indicator.init(fromJSONObject: jsonObject["indicator"]),
                  value: jsonObject["value"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [IndicatorEntry] {
        var modelList = [IndicatorEntry]()
        for i in 0..<jsonArray.count {
            modelList.append(IndicatorEntry.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
