//
//  BetterLifeApi.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 29/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

class BetterLifeApi {
    private static let baseUrl: String = "https://followlife.herokuapp.com"
    
    public static var doctorsUrl: String {
        return "\(baseUrl)/api/v1/doctors"
    }
    
    public static var patientsUrl: String {
        return "\(baseUrl)/api/v1/patients"
    }
    
    public static var resourcesUrl: String {
        return "\(baseUrl)/api/v1/resources"
    }
}
