//
//  Appointment.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Appointment {
    var id: Int
    var doctor: Doctor
    var patient: Patient
    var appointmentDate: Date
    var reason: String
    var canceledAt: Date?
    var status: String
    
    public init() {
        self.id = 0
        self.patient = Patient.init()
        self.doctor = Doctor.init()
        self.appointmentDate = Utils.getTimeNow()
        self.reason = ""
        self.canceledAt = nil
        self.status = "ACT"
    }
    
    public init(id: Int, patient: Patient, doctor: Doctor, appointmentDate: Date, reason: String?, canceledAt: Date?, status: String?) {
        self.id = id
        self.patient = patient
        self.doctor = doctor
        self.appointmentDate = appointmentDate
        self.reason = (reason == nil) ? "" : reason!
        self.canceledAt = (canceledAt == nil || canceledAt == Utils.getTimeNow()) ? nil : canceledAt!
        self.status = (status == nil) ? "" : status!
    }
    
    public init(id: Int, patient: Patient, doctor: Doctor, appointmentDate: String, reason: String?, canceledAt: String?, status: String?) {
        self.id = id
        self.patient = patient
        self.doctor = doctor
        self.appointmentDate = Utils.convertDate(from: appointmentDate)
        self.reason = (reason == nil) ? "" : reason!
        self.canceledAt = (canceledAt == nil || canceledAt == "") ? nil : Utils.convertDate(from: canceledAt!)
        self.status = (status == nil) ? "" : status!
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  patient: Patient.init(fromJSONObject: jsonObject["patient"]),
                  doctor: Doctor.init(fromJSONObject: jsonObject["doctor"]),
                  appointmentDate: jsonObject["appointmentDate"].stringValue,
                  reason: jsonObject["reason"].stringValue,
                  canceledAt: jsonObject["canceledAt"].stringValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Appointment] {
        var modelList = [Appointment]()
        for i in 0..<jsonArray.count {
            modelList.append(Appointment.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
