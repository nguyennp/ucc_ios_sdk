//
//  Person.swift
//  it3VideoCallSample
//
//  Created by Hieu Tran on 10/6/20.
//

import Foundation
import ObjectMapper
    
class Person: Mappable {
    var uuid = UUID().uuidString
    var HO_TEN = ""
    var QUAN_HE = ""
    var DEVICE_ID = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    convenience init(hoTen: String, quanHe: String, deviceId: String) {
        self.init()
        self.HO_TEN = hoTen
        self.QUAN_HE = quanHe
        self.DEVICE_ID = deviceId
    }
    
    func mapping(map: Map) {
        self.uuid <- map["uuid"]
        self.HO_TEN <- map["HO_TEN"]
        self.QUAN_HE <- map["QUAN_HE"]
        self.DEVICE_ID <- map["DEVICE_ID"]
    }
}
