//
//  User.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 28/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var id: Int
    var role: Role
    var email: String
    var password: String
    var fullName: String
    var lastName: String
    var phoneNumber: String
    var profilePicture: String
    var lastIPConnection: String
    var status: String
    
    public init() {
        self.id = 0
        self.role = Role.init()
        self.email = ""
        self.password = ""
        self.fullName = ""
        self.lastName = ""
        self.phoneNumber = ""
        self.profilePicture = ""
        self.lastIPConnection = ""
        self.status = ""
    }
    
    public init(id: Int, role: Role, email: String, password: String, fullName: String, lastName: String, phoneNumber: String, profilePicture: String, lastIPConnection: String, status: String) {
        self.id = id
        self.role = role
        self.email = email
        self.password = password
        self.fullName = fullName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.profilePicture = profilePicture
        self.lastIPConnection = lastIPConnection
        self.status = status
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  role: Role.init(fromJSONObject: jsonObject["role"]),
                  email: jsonObject["email"].stringValue,
                  password: jsonObject["password"].stringValue,
                  fullName: jsonObject["fullName"].stringValue,
                  lastName: jsonObject["lastName"].stringValue,
                  phoneNumber: jsonObject["phoneNumber"].stringValue,
                  profilePicture: jsonObject["profilePicture"].stringValue,
                  lastIPConnection: jsonObject["lastIPConnection"].stringValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [User] {
        var modelList = [User]()
        let count = jsonArray.count
        for i in 0..<count {
            modelList.append(User.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
