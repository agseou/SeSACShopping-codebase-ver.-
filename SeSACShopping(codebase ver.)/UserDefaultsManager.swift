//
//  File.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/25.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    enum UDKey: String {
        case userState
        case nickName
        case profileImage
        case searchList
        case like
    }
    
    let ud = UserDefaults.standard
    
    var userState: Bool {
        get { ud.bool(forKey: UDKey.userState.rawValue) }
        set { ud.setValue(newValue, forKey: UDKey.userState.rawValue) }
    }
    
    var nickName: String {
        get { ud.string(forKey: UDKey.nickName.rawValue) ?? "user" }
        set { ud.setValue(newValue, forKey: UDKey.nickName.rawValue) }
    }
    
    var profileImage: String {
        get { ud.string(forKey: UDKey.profileImage.rawValue) ?? "profile\(Int.random(in: 1...14))" }
        set { ud.setValue(newValue, forKey: UDKey.profileImage.rawValue) }
    }
    
    var searchList: [String?] {
        get { ud.stringArray(forKey: UDKey.searchList.rawValue) ?? [] }
        set { ud.setValue(newValue, forKey: UDKey.searchList.rawValue) }
    }
    
    var like: [String?] {
        get { ud.stringArray(forKey: UDKey.like.rawValue) ?? [] }
        set { ud.setValue(newValue, forKey: UDKey.like.rawValue) }
    }
}
