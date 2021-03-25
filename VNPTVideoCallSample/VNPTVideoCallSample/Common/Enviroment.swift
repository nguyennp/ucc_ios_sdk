//
//  Enviroment.swift
//  VNPTVideoCallSample
//
//  Created by Hieu Tran on 09/12/2020.
//

import UIKit
import Foundation
import SystemConfiguration

public enum Environment {
    
}

//MARK: DEVICE INFO
extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}

extension Environment {
    static let UUID: String = {
       return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }()
    
    
    static let deviceName: String = {
       return "\(UIDevice.current.model) - \(UIDevice.current.name) - \(UIDevice.current.systemVersion)"
    }()
    
    static let appVersion: String = {
       return "\(Bundle.main.releaseVersionNumber ?? "1.0")"
    }()
    
    static let buildVersion: String = {
       return "\(Bundle.main.buildVersionNumber ?? "")"
    }()
    
    static let appName: String = {
        return "\(Bundle.main.displayName ?? "VnCare")"
    }()
    
    static let fullAppVersionName:String = {
        return "\(Environment.appName) v\(Environment.appVersion) (\(Environment.buildVersion))"
    }()
    
    static let OSVersion:String = {
        return UIDevice.current.systemVersion
    }()
}
