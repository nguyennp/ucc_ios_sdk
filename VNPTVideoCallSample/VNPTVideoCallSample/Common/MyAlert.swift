//
//  MyAlert.swift
//  it3VideoCallSample
//
//  Created by Hieu Tran on 10/6/20.
//

import UIKit
import Toast_Swift

open class MyAlert {
    open class var shared: MyAlert {
        struct Static {
            static let instance: MyAlert = MyAlert()
        }
        return Static.instance
    }
    
    private init(){}
    
    open func showAlertWithSnackBar(_ msg: String) {
        let timeout: TimeInterval = 2.0
        DispatchQueue.main.async {
            UIApplication.topViewController()?.view.makeToast(msg, duration: timeout)
        }
    }
    
    open func showAlert(title:String = "Thông báo", msg:String, buttonTitle: String = "Đóng", completionHandler: (() -> Void)? = nil, btnOkHandler: (() -> Void)? = nil){
        let myAlert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let myOkAction = UIAlertAction(title: buttonTitle, style: .default) {UIAlertAction in
            if btnOkHandler != nil {btnOkHandler!()}
        }
        myAlert.addAction(myOkAction)
        UIApplication.topViewController()?.present(myAlert, animated: true, completion: completionHandler)
    }
    
    open func showAlert(title:String, msg:String, btnOkTitle: String, btnCancelTitle: String, completionHandler: (() -> Void)? = nil, btnOkHandler: (() -> Void)? = nil, btnCancelHandler: (() -> Void)? = nil, btnOkStyle: UIAlertAction.Style = .default, btnCancelStyle: UIAlertAction.Style = .default){
        let myAlert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let myOkAction = UIAlertAction(title: btnOkTitle, style: btnOkStyle) {action in
            if btnOkHandler != nil {btnOkHandler!()}
        }
        let cancelAction = UIAlertAction(title: btnCancelTitle, style: btnCancelStyle) {action in
            if btnCancelHandler != nil {btnCancelHandler!()}
        }
        myAlert.addAction(cancelAction)
        myAlert.addAction(myOkAction)
        UIApplication.topViewController()?.present(myAlert, animated: true, completion: completionHandler)
    }
}
