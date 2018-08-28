//
//  Preference.swift
//  BetterLifeFramework
//
//  Created by Hugo Andres on 29/07/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

public class Preferences {
    private static let preferences: UserDefaults = UserDefaults.standard
    
    public static func saveData(key: String, value: String) {
        preferences.set(value, forKey: key)
        
        let didSave = preferences.synchronize()
        
        if !didSave {
            print("Error saving \(value) in UserDefaults")
        }
    }
    
    public static func retreiveData(key: String) -> String {
        guard let value: String = preferences.string(forKey: key) else {
            return ""
        }
        return value
    }
    
    public static func retreiveData(key: String) -> Int {
        var value: Int = 0
        
        value = preferences.integer(forKey: key)
        
        return value
    }
    
    func addIconToTextField(textField: UITextField, icon: UIImage, widthMargin: CGFloat, heightMargin: CGFloat, padding: Int) {
        let iconWidth: CGFloat = icon.size.width - CGFloat(padding)
        let iconHeight: CGFloat = icon.size.height - CGFloat(padding)
        
        let leftImageView = UIImageView(frame: CGRect(x: widthMargin, y: heightMargin, width: iconWidth, height: iconHeight))
        leftImageView.image = icon
        let view = UIView(frame: CGRect(x: 0, y: 0, width: iconWidth + widthMargin, height: iconHeight + heightMargin))
        view.addSubview(leftImageView)
        textField.leftView = view
        textField.leftViewMode = .always
    }
}
