//
//  UserInfoManager.swift
//  SimpleMemoApp
//
//  Created by mac on 2021/04/27.
//

import UIKit

struct UserInfoKey {
    static let loginId = "LOGINID"
    static let account = "ACCOUNT"
    static let name = "NAME"
}
class UserInfoManager {
    
    var isLogin: Bool {
        if self.loginId == 0 || self.account == nil {
            return false
        }else {
            return true
        }
    }
    
    var loginId: Int {
        get {
            return UserDefaults.standard.integer(forKey: UserInfoKey.loginId)
        }
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue, forKey: UserInfoKey.loginId)
            userDefault.synchronize()
        }
    }
    var account: String? {
        get {
            return UserDefaults.standard.string(forKey: UserInfoKey.account)
        }
        set {
            let userDefault = UserDefaults.standard
            userDefault.setValue(newValue, forKey: UserInfoKey.account)
            userDefault.synchronize()
        }
    }
    var name: String? {
        get {
            return UserDefaults.standard.string(forKey: UserInfoKey.name)
        }
        set {
            let userDefault = UserDefaults.standard
            userDefault.setValue(newValue, forKey: UserInfoKey.name)
            userDefault.synchronize()
        }
    }
    func login(account: String, password: String) -> Bool {
        
        if account.isEqual("sj2joy@naver.com") && password.isEqual("1111") {
            let userDefault = UserDefaults.standard
            userDefault.set(100, forKey: UserInfoKey.loginId)
            userDefault.set(account, forKey: UserInfoKey.account)
            userDefault.set("장석진", forKey: UserInfoKey.name)
            userDefault.synchronize()
            return true
        } else {
            return false
        }
    }
    func logout() -> Bool {
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: UserInfoKey.loginId)
        userDefault.removeObject(forKey: UserInfoKey.account)
        userDefault.removeObject(forKey: UserInfoKey.name)
        userDefault.synchronize()
        return true
    }
}
