//
//  Membership.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Membership {
    var id: Int
    var doctor: Doctor
    var patient: Patient
    var referencedEmail: String
    var accessCode: String
    var expiredAt: Date
    var status: String
    
    public init() {
        self.id = 0
        self.doctor = Doctor.init()
        self.patient = Patient.init()
        self.referencedEmail = ""
        self.accessCode = ""
        self.expiredAt = Utils.getTimeNow()
        self.status = ""
    }
    
    public init(id: Int, doctor: Doctor, patient: Patient, referencedEmail: String, accessCode: String, expiredAt: Date, status: String) {
        self.id = id
        self.doctor = doctor
        self.patient = patient
        self.referencedEmail = referencedEmail
        self.accessCode = accessCode
        self.expiredAt = expiredAt
        self.status = status
    }
    
    public init(id: Int, doctor: Doctor, patient: Patient, referencedEmail: String, accessCode: String, expiredAt: String, status: String) {
        self.id = id
        self.doctor = doctor
        self.patient = patient
        self.referencedEmail = referencedEmail
        self.accessCode = accessCode
        self.expiredAt = Utils.convertDate(from: expiredAt)
        self.status = status
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  doctor: Doctor.init(fromJSONObject: jsonObject["doctor"]),
                  patient: Patient.init(fromJSONObject: jsonObject["patient"]),
                  referencedEmail: jsonObject["referencedEmail"].stringValue,
                  accessCode: jsonObject["accessCode"].stringValue,
                  expiredAt: jsonObject["expiredAt"].stringValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Membership] {
        var modelList = [Membership]()
        let count = jsonArray.count
        for i in 0..<count {
            modelList.append(Membership.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
