//
//  ToastService.swift
//  VNPTVideoCallSample
//
//  Created by DoanPhanThanh on 18/03/2021.
//

import UIKit
import Foundation

open class ToastService {
    open class var shared: ToastService {
        struct Static {
            static let instance: ToastService = ToastService()
        }
        return Static.instance
    }
    
    private init() {}
    
    open func showToast(message: String, seconds: Double = 3.0) {
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.showToastMessage(message: message)
        }
    }
}
