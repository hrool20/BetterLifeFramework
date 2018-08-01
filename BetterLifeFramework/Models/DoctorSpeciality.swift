//
//  DoctorSpeciality.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

public class DoctorSpeciality {
    var id: Int
    var doctor: Doctor
    var medicalSpeciality: MedicalSpeciality
    
    public init() {
        self.id = 0
        self.doctor = Doctor.init()
        self.medicalSpeciality = MedicalSpeciality.init()
    }
    
    public init(id: Int, doctor: Doctor, medicalSpeciality: MedicalSpeciality) {
        self.id = id
        self.doctor = doctor
        self.medicalSpeciality = medicalSpeciality
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  doctor: Doctor.init(fromJSONObject: jsonObject["doctor"]),
                  medicalSpeciality: MedicalSpeciality.init(fromJSONObject: jsonObject["medicalSpeciality"]))
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [DoctorSpeciality] {
        var modelList = [DoctorSpeciality]()
        for i in 0..<jsonArray.count {
            modelList.append(DoctorSpeciality.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
