//
//  Prescription.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Prescription {
    var id: Int
    var doctor: Doctor
    var patient: Patient
    var prescriptionType: PrescriptionType
    var frequency: String
    var quantity: Int
    var durationInDays: Int
    var description: String
    var startedAt: Date
    var finishedAt: Date
    var status: String
    
    public init() {
        self.id = 0
        self.doctor = Doctor.init()
        self.patient = Patient.init()
        self.prescriptionType = PrescriptionType.init()
        self.frequency = ""
        self.quantity = 0
        self.durationInDays = 0
        self.description = ""
        self.startedAt = Utils.getTimeNow()
        self.finishedAt = Utils.getTimeNow()
        self.status = ""
    }
    
    public init(id: Int, doctor: Doctor, patient: Patient, prescriptionType: PrescriptionType, frequency: String, quantity: Int, durationInDays: Int, description: String, startedAt: Date, finishedAt: Date, status: String) {
        self.id = id
        self.doctor = doctor
        self.patient = patient
        self.prescriptionType = prescriptionType
        self.frequency = frequency
        self.quantity = quantity
        self.durationInDays = durationInDays
        self.description = description
        self.startedAt = startedAt
        self.finishedAt = finishedAt
        self.status = status
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  doctor: .init(fromJSONObject: jsonObject["doctor"]),
                  patient: .init(fromJSONObject: jsonObject["patient"]),
                  prescriptionType: .init(fromJSONObject: jsonObject["prescriptionType"]),
                  frequency: jsonObject["frequency"].stringValue,
                  quantity: jsonObject["quantity"].intValue,
                  durationInDays: jsonObject["durationInDays"].intValue,
                  description: jsonObject["description"].stringValue,
                  startedAt: Utils.convertDate(from: jsonObject["startedAt"].stringValue),
                  finishedAt: Utils.convertDate(from: jsonObject["finishedAt"].stringValue),
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Prescription] {
        var modelList = [Prescription]()
        let count = jsonArray.count
        for i in 0..<count {
            modelList.append(Prescription.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
