//
//  User.swift
//  P3Splashtutorial
//
//  Created by cmStudent on 2021/08/02.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import Foundation

class User {
    
    // MARK: - Initializer
    private init() {}
    
    
    // MARK: - Static Properties
    /// Userのshared
    static let shared = User()
    
    
    // MARK: - Properties
    /// 新規ユーザーかどうか
    var isNewUser: Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    
    // MARK: - Func
    /// 新規ユーザーでないことを設定する
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
    
}
