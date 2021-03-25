//
//  AddNewPersonViewController.swift
//  it3VideoCallSample
//
//  Created by Hieu Tran on 10/6/20.
//

import UIKit

class AddNewPersonViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtHoTen: MySkyTextField!
    @IBOutlet weak var txtMoTa: MySkyTextField!
    @IBOutlet weak var txtDeviceId: MySkyTextField!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    var isNew = false
    var person = Person()
    var onSaveSuccess: ((_ data: Person) -> Void)?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeup()
    }
}

//MARK: - View
extension AddNewPersonViewController {
    func makeup() {
        self.lblTitle.text = self.isNew ? "THÊM MỚI DANH BẠ" : "CHỈNH SỬA DANH BẠ"
        self.txtHoTen.text = self.person.HO_TEN
        self.txtMoTa.text = self.person.QUAN_HE
        self.txtDeviceId.text = self.person.DEVICE_ID
        
        self.txtHoTen.delegate = self
        self.txtMoTa.delegate = self
        self.txtDeviceId.delegate = self
        
        self.txtHoTen.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
        self.txtMoTa.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
        self.txtDeviceId.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
        
        self.btnCancel.addTarget(self, action: #selector(actBtnClose), for: .touchUpInside)
        self.btnSave.addTarget(self, action: #selector(actBtnSave), for: .touchUpInside)
    }
    
    @objc func actBtnClose() {
        self.dismiss(animated: true)
    }
    
    @objc func actBtnSave() {
        self.view.endEditing(true)
        if self.validate() {
            self.person.HO_TEN = self.txtHoTen.text!
            self.person.QUAN_HE = self.txtMoTa.text!
            self.person.DEVICE_ID = self.txtDeviceId.text!
            if var data = UserDefaultsRepo.getDanhBa() {
                let index = data.firstIndex(where: {$0.uuid == self.person.uuid})
                if index == nil {
                    data.append(self.person)
                } else {
                    data[index!] = self.person
                }
                UserDefaultsRepo.save(danhBa: data)
            } else {
                UserDefaultsRepo.save(danhBa: [self.person])
            }
            
            self.dismiss(animated: true) {
                if self.onSaveSuccess != nil {
                    self.onSaveSuccess!(self.person)
                }
            }
        }
    }
    
    func validate() -> Bool {
        let validate1 = self.txtHoTen.validate(.REQUIRED, required: true).isValid
        let validate2 = self.txtMoTa.validate(.REQUIRED, required: true).isValid
        let validate3 = self.txtDeviceId.validate(.REQUIRED, required: true).isValid
        return validate1 && validate2 && validate3
    }
}

//MARK: UITextFieldDelegate
extension AddNewPersonViewController: MySkyDelegate {
    func onEditingChanged(_ sender: MySkyTextField) {
        if sender == self.txtHoTen {
            let _ = self.txtHoTen.validate(.REQUIRED, required: true, isShake: false)
        } else if sender == self.txtMoTa {
            let _ = self.txtMoTa.validate(.REQUIRED, required: true, isShake: false)
        } else if sender == self.txtDeviceId {
            let _ = self.txtDeviceId.validate(.REQUIRED, required: true, isShake: false)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.onEditingChanged(textField as! MySkyTextField)
    }
}

