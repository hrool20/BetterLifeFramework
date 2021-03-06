//
//  Indicator.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Indicator {
    var id: Int
    var patient: Patient
    var indicatorType: IndicatorType
    var quantity: Float
    var frequency: String
    
    public init() {
        self.id = 0
        self.patient = Patient.init()
        self.indicatorType = IndicatorType.init()
        self.quantity = 0.0000
        self.frequency = ""
    }
    
    public init(id: Int, patient: Patient, indicatorType: IndicatorType, quantity: Float?, frequency: String?) {
        self.id = id
        self.patient = patient
        self.indicatorType = indicatorType
        self.quantity = (quantity == nil) ? 0.0000 : quantity!
        self.frequency = (frequency == nil) ? "" : frequency!
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  patient: Patient.init(fromJSONObject: jsonObject["patient"]),
                  indicatorType: IndicatorType.init(fromJSONObject: jsonObject["indicatorType"]),
                  quantity: jsonObject["quantity"].floatValue,
                  frequency: jsonObject["frequency"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Indicator] {
        var modelList = [Indicator]()
        for i in 0..<jsonArray.count {
            modelList.append(Indicator.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
