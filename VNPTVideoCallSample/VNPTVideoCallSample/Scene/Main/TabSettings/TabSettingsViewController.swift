//
//  TabSettingsViewController.swift
//  VNPTVideoCallSample
//
//  Created by Hieu Tran on 10/23/20.
//

import UIKit
import VNPTVideoCallSDK

class TabSettingsViewController: UIViewController {
    
    @IBOutlet weak var txtYourId: MySkyTextField! {
        didSet {
            self.txtYourId.text = UserDefaultsRepo.getYourId() ?? VNPTMeet.shared.yourDeviceId
            self.txtYourId.delegate = self
        }
    }
    @IBOutlet weak var txtYourName: MySkyTextField! {
        didSet {
            self.txtYourName.text = UserDefaultsRepo.getYourName()
            self.txtYourName.delegate = self
        }
    }
    @IBOutlet weak var lblAppVersionName: UILabel!
    @IBOutlet weak var btnRegisterDevice: UIButton! {
        didSet {
            self.btnRegisterDevice.addTarget(self, action: #selector(registerDevice), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var btnRemoveDevice: UIButton! {
        didSet {
            self.btnRemoveDevice.addTarget(self, action: #selector(removeDevice), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblAppVersionName.text = Environment.fullAppVersionName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Settings"
        let _ = self.txtYourName.validate(.REQUIRED)
    }
    
    @objc func registerDevice() {
        guard let id = self.txtYourId.text, !id.isEmpty else {
            let _ = self.txtYourId.validate(.REQUIRED)
            return
        }
        guard let name = self.txtYourName.text, !name.isEmpty else {
            let _ = self.txtYourName.validate(.REQUIRED)
            return
        }
        VNPTMeet.shared.personIdApp = PersonIdApp(id: id, name: name)
        VNPTMeet.shared.registerDevice()
    }
    
    @objc func removeDevice() {
        VNPTMeet.shared.removeDevice()
    }
}

//MARK: MySkyDelegate
extension TabSettingsViewController : MySkyDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.txtYourName {
            UserDefaultsRepo.save(yourName: textField.text ?? "")
        } else if textField == self.txtYourId {
            UserDefaultsRepo.save(yourId: textField.text ?? "")
        }
    }
}
