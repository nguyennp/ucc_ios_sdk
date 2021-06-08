//
//  AppDelegate.swift
//  VNPTVideoCallSample
//
//  Created by Hieu Tran on 10/7/20.
//

import UIKit
import VNPTVideoCallSDK
import JitsiMeet
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.configVNPTMeet()
        
        //IQKeyboardManager CONFIG
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        //MARK: WINDOW APPLICATION CONFIG
        let splash = SplashScreenViewController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = splash
        self.window?.makeKeyAndVisible()
        
        return VNPTMeet.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func application(_ application: UIApplication,continue userActivity: NSUserActivity,restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        return VNPTMeet.shared.application(application, continue: userActivity, restorationHandler: restorationHandler)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return VNPTMeet.shared.application(app, open: url, options: options)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        VNPTMeet.shared.applicationWillTerminate(application)
    }
    
    func configVNPTMeet() {
        VNPTMeetConfig.shared.ENABLE_OUTGOING_CALL_WAITTING_SCREEN = true
        VNPTMeetConfig.shared.IMCOMING_CALL_TIMEOUT = 30.0
        VNPTMeetConfig.shared.TIMEOUT_CONNECTION = 240.0
        VNPTMeetConfig.shared.TIMEOUT_INTERVAL = 2400.0
        VNPTMeetConfig.shared.VERSION = ""
        VNPTMeetConfig.shared.TOKEN_ID = ""
        VNPTMeetConfig.shared.TOKEN_KEY = ""
        VNPTMeetConfig.shared.CLIENT_ID = ""
        VNPTMeetConfig.shared.CLIENT_SECRET = ""
        VNPTMeet.shared.delegate = self
    }
}

//MARK: VNPTMeetDelegate
extension AppDelegate: VNPTMeetDelegate {
    func vnptMeet(didRegisterPushVoipToken token: String, withError error: VNPTMeetError?) {
        guard let msg = error?.message else {
            MyAlert.shared.showAlertWithSnackBar("Đăng ký thiết bị thành công")
            return
        }
        MyAlert.shared.showAlertWithSnackBar("\(error?.responseCode ?? "No responseCode") - \(msg)")
    }
    
    func vnptMeet(didReceiveCallPush call: CallingPerson) {
        print("printLog didReceiveCallPush.. \(call.calling)")
        MyAlert.shared.showAlertWithSnackBar("Nhận được call push \(call.calling)")
        switch call.connectedState {
        case .REJECTED :
            ToastService.shared.showToast(message: "Cuộc gọi đã bị từ chối")
            break
        case .UNKNOWN:
            break
        case .PENDING:
            ToastService.shared.showToast(message: "Đang chờ...")
            break
        case .ACCEPTED:
            ToastService.shared.showToast(message: "Đã chập nhận cuộc gọi")
            break
        case .FINISHED:
            ToastService.shared.showToast(message: "Kết thúc cuộc gọi")
            break
        case .TIMEOUT:
            break
        case .DENIED:
            break
        case .LEAVE:
            break
        }
    }
    
    func vnptMeet(didReceiveIncomingCall call: CallingPerson) {
        print("printLog didReceiveIncomingCall..")
        ToastService.shared.showToast(message: "Có cuộc gọi đến")
    }
    
    func vnptMeet(didMakeACall call: CallingPerson, withError error: VNPTMeetError?) {
        print("printLog didMakeACall..")
        guard let msg = error?.message else {
            ToastService.shared.showToast(message: "Khởi tạo cuộc gọi thành công!")
            return
        }
        ToastService.shared.showToast(message: "\(error?.responseCode ?? "No responseCode") - \(msg)")
    }
    
    func vnptMeet(didAcceptCall call: CallingPerson, withError error: VNPTMeetError?) {
        print("printLog didAcceptCall..")
        guard let msg = error?.message else {
            ToastService.shared.showToast(message: "Chấp nhận cuộc gọi thành công")
            return
        }
        ToastService.shared.showToast(message: "\(error?.responseCode ?? "No responseCode") - \(msg)")
    }
    
    func vnptMeet(didEndCall call: CallingPerson, withError error: VNPTMeetError?) {
        print("printLog didEndCall..")
        guard let msg = error?.message else {//            ToastService.shared.showToast(message: "Kết thúc cuộc gọi thành công!")
            print("printLog didEndCall Kết thúc cuộc gọi")
            return
        }
        ToastService.shared.showToast(message: "\(error?.responseCode ?? "No responseCode") - \(msg)")
    }
    
    func vnptMeet(didRejectCall call: CallingPerson, withError error: VNPTMeetError?) {
        print("printLog didRejectCall..")
        guard let msg = error?.message else {
            ToastService.shared.showToast(message: "Từ chối cuộc gọi thành công!")
            print("printLog didRejectCall Từ chối cuộc gọi")
            return
        }
        ToastService.shared.showToast(message: "\(error?.responseCode ?? "No responseCode") - \(msg)")
    }
    
    func vnptMeet(didRemoveDevice removed: Bool, withError error: VNPTMeetError?) {
        print("printLog didRemoveDevice")
        guard let msg = error?.message else {
            ToastService.shared.showToast(message: "Huỷ đăng ký thiết bị thành công!")
            return
        }
        ToastService.shared.showToast(message: "\(error?.responseCode ?? "No responseCode") - \(msg)")
    }
    
    func vnptMeet(didIncomingCallTimeout timeout: Bool, withError error: VNPTMeetError?) {
        print("printLog didIncomingCallTimeout..")
        ToastService.shared.showToast(message: "Hết hạn cuộc gọi đến")
    }
    
    func vnptMeet(didOutgoingCallTimeout timeout: Bool, withError error: VNPTMeetError?) {
        print("printLog didOutgoingCallTimeout..")
        ToastService.shared.showToast(message: "Hết hạn cuộc gọi đi")
    }
}

extension AppDelegate {
    func showToastMessage(message : String) {
        let timeout: TimeInterval = 2.0
        DispatchQueue.main.async {
            self.window?.rootViewController?.view.makeToast(message, duration: timeout)
        }
    }
}
