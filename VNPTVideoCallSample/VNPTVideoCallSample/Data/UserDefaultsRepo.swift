//
//  UserDefaultsRepo.swift
//  it3VideoCallSample
//
//  Created by Hieu Tran on 10/6/20.
//

import Foundation
import ObjectMapper

struct UserDefaultsRepo {
    enum Keys {
        static let YOUR_ID = "YOUR_ID"
        static let YOUR_NAME = "YOUR_NAME"
        static let DANH_BA = "DANH_BA"
        static let PK_TOKEN = "PK_TOKEN"
    }
    
    static func save(yourId: String){
        UserDefaults.standard.set(yourId, forKey: Keys.YOUR_ID)
        UserDefaults.standard.synchronize()
    }
    
    static func save(yourName: String){
        UserDefaults.standard.set(yourName, forKey: Keys.YOUR_NAME)
        UserDefaults.standard.synchronize()
    }
    
    static func save(danhBa: [Person]){
        UserDefaults.standard.set(danhBa.toJSONString(), forKey: Keys.DANH_BA)
        UserDefaults.standard.synchronize()
    }
    
    static func save(token: String){
        UserDefaults.standard.set(token, forKey: Keys.PK_TOKEN)
        UserDefaults.standard.synchronize()
    }
    
    static func getYourId()-> String? {
        return UserDefaults.standard.value(forKey: Keys.YOUR_ID) as? String
    }
    
    static func getYourName()-> String? {
        return UserDefaults.standard.value(forKey: Keys.YOUR_NAME) as? String
    }
    
    static func getDanhBa()-> [Person]? {
        if let json = UserDefaults.standard.value(forKey: Keys.DANH_BA) as? String {
            let list = Mapper<Person>().mapArray(JSONString: json)
            return list
        }
        return nil
    }
    
    static func getPKToken()-> String? {
        return UserDefaults.standard.value(forKey: Keys.PK_TOKEN) as? String
    }
    
    static func clearAllDanhBa(){
        UserDefaults.standard.removeObject(forKey: Keys.DANH_BA)
        UserDefaults.standard.synchronize()
    }
}
