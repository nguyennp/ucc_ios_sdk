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
            MyAlert.shared.showAlertWithSnackBar("????ng k?? thi???t b??? th??nh c??ng")
            return
        }
        MyAlert.shared.showAlertWithSnackBar("\(error?.responseCode ?? "No responseCode") - \(msg)")
    }
    
    func vnptMeet(didReceiveCallPush call: CallingPerson) {
        print("printLog didReceiveCallPush.. \(call.calling)")
        MyAlert.shared.showAlertWithSnackBar("Nh???n ???????c call push \(call.calling)")
        switch call.connectedState {
        case .REJECTED :
            ToastService.shared.showToast(message: "Cu???c g???i ???? b??? t??? ch???i")
            break
        case .UNKNOWN:
            break
        case .PENDING:
            ToastService.shared.showToast(message: "??ang ch???...")
            break
        case .ACCEPTED:
            ToastService.shared.showToast(message: "???? ch???p nh???n cu???c g???i")
            break
        case .FINISHED:
            ToastService.shared.showToast(message: "K???t th??c cu???c g???i")
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
        ToastService.shared.showToast(message: "C?? cu???c g???i ?????n")
    }
    
    func vnptMeet(didMakeACall call: CallingPerson, withError error: VNPTMeetError?) {
        print("printLog didMakeACall..")
        guard let msg = error?.message else {
            ToastService.shared.showToast(message: "Kh???i t???o cu???c g???i th??nh c??ng!")
            return
        }
        ToastService.shared.showToast(message: "\(error?.responseCode ?? "No responseCode") - \(msg)")
    }
    
    func vnptMeet(didAcceptCall call: CallingPerson, withError error: VNPTMeetError?) {
        print("printLog didAcceptCall..")
        guard let msg = error?.message else {
            ToastService.shared.showToast(message: "Ch???p nh???n cu???c g???i th??nh c??ng")
            return
        }
        ToastService.shared.showToast(message: "\(error?.responseCode ?? "No responseCode") - \(msg)")
    }
    
    func vnptMeet(didEndCall call: CallingPerson, withError error: VNPTMeetError?) {
        print("printLog didEndCall..")
        guard let msg = error?.message else {//            ToastService.shared.showToast(message: "K???t th??c cu???c g???i th??nh c??ng!")
            print("printLog didEndCall K???t th??c cu???c g???i")
            return
        }
        ToastService.shared.showToast(message: "\(error?.responseCode ?? "No responseCode") - \(msg)")
    }
    
    func vnptMeet(didRejectCall call: CallingPerson, withError error: VNPTMeetError?) {
        print("printLog didRejectCall..")
        guard let msg = error?.message else {
            ToastService.shared.showToast(message: "T??? ch???i cu???c g???i th??nh c??ng!")
            print("printLog didRejectCall T??? ch???i cu???c g???i")
            return
        }
        ToastService.shared.showToast(message: "\(error?.responseCode ?? "No responseCode") - \(msg)")
    }
    
    func vnptMeet(didRemoveDevice removed: Bool, withError error: VNPTMeetError?) {
        print("printLog didRemoveDevice")
        guard let msg = error?.message else {
            ToastService.shared.showToast(message: "Hu??? ????ng k?? thi???t b??? th??nh c??ng!")
            return
        }
        ToastService.shared.showToast(message: "\(error?.responseCode ?? "No responseCode") - \(msg)")
    }
    
    func vnptMeet(didIncomingCallTimeout timeout: Bool, withError error: VNPTMeetError?) {
        print("printLog didIncomingCallTimeout..")
        ToastService.shared.showToast(message: "H???t h???n cu???c g???i ?????n")
    }
    
    func vnptMeet(didOutgoingCallTimeout timeout: Bool, withError error: VNPTMeetError?) {
        print("printLog didOutgoingCallTimeout..")
        ToastService.shared.showToast(message: "H???t h???n cu???c g???i ??i")
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
