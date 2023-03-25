//
//  AccoutManager.swift
//  test
//
//  Created by  Максим Мартынов on 25.03.2023.
//

import Foundation

//struct User {
//    var email: String
//    var firstName
//}

public class AccountManager {
    let userDefaults = UserDefaults.standard
    
    public func checkUser(firstName: String, password: String) -> Bool {
        
        
        guard userDefaults.object(forKey: firstName) != nil else {
            DispatchQueue.main.async {
                self.userDefaults.set(password, forKey: firstName)
            }
            return false
        }
        
        return true
    }
}

