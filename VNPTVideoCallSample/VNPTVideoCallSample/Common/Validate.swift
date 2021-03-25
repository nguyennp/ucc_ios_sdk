//
//  Validate.swift
//  it3VideoCallSample
//
//  Created by Hieu Tran on 10/6/20.
//

import Foundation

enum ValidateType {
    case PASSWORD
    case PASSWORD_UPDATE
    case ACCOUNT
    case EMAIL
    case PHONE_NUMBER
    case SO_GIAYTO
    case SO_BHYT
    case REQUIRED
}

class ValidateResult {
    var isValid = true
    var errMsg = ""
}

extension String {
    func validate(_ type: ValidateType, required: Bool = false) -> ValidateResult {
        //let validation = ValidateResult()
        switch type {
        case .PASSWORD:
            return self.validatePassword()
        case .PASSWORD_UPDATE:
            return self.validatePasswordUpdate()
        case .ACCOUNT:
            return self.validateTaiKhoan()
        case .EMAIL:
            return self.validateEmail(required: required)
        case .PHONE_NUMBER:
            return self.validatePhone(required: required)
        case .SO_GIAYTO:
            return self.validateSoGiayTo(required: required)
        case .SO_BHYT:
            return self.validateSoBHYT(required: required)
        case .REQUIRED:
            return self.validateRequired()
        }
        //return validation
    }
    
    func validatePassword() -> ValidateResult {
        let validation = ValidateResult()
        
        if self.count == 0 {
            validation.isValid = false
            validation.errMsg = "Không để trống"
        } else if self.count < 6 {
            validation.isValid = false
            validation.errMsg = "Không ít hơn 6 ký tự."
        }
        
        return validation
    }
    
    func validatePasswordUpdate() -> ValidateResult {
        let validation = ValidateResult()
        
        if self.count == 0 {
            validation.isValid = false
            validation.errMsg = "Không để trống"
        } else if self.count < 6 {
            validation.isValid = false
            validation.errMsg = "Không ít hơn 6 ký tự."
        } else {
//            let passRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])[^\\s]{6,}$"
            let passRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[^\\s]{6,}$"
            let passCheck = NSPredicate(format:"SELF MATCHES %@", passRegEx)
            if !passCheck.evaluate(with: self) {
                validation.isValid = false
                validation.errMsg = "không đúng định dạng"
            }
        }
        
        return validation
    }
    
    func validateTaiKhoan() -> ValidateResult {
        let validation = ValidateResult()
        
        if self.count == 0 {
            validation.isValid = false
            validation.errMsg = "Không để trống"
        }
        
        return validation
    }
    
    func validateEmail(required: Bool = false) -> ValidateResult {
        let validation = ValidateResult()
        
        if self.count > 0 {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailCheck = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            if !emailCheck.evaluate(with: self) {
                validation.isValid = false
                validation.errMsg = "Email không đúng định dạng"
            }
        } else if required {
            validation.isValid = false
            validation.errMsg = "Không để trống"
        }
        
        return validation
    }
    
    func validatePhone(required: Bool = false) -> ValidateResult {
        let validation = ValidateResult()
        
        if self.count > 0 {
            let phoneRegEx = "^\\d{10,11}$"
            let phoneCheck = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
            if !phoneCheck.evaluate(with: self) {
                validation.isValid = false
                validation.errMsg = "Không đúng định dạng"
            }
        } else if required {
            validation.isValid = false
            validation.errMsg = "Không để trống"
        }
        return validation
    }
    
    func validateRequired(errMsg: String = "Không để trống") -> ValidateResult {
        let validation = ValidateResult()
        
        if self.count == 0 {
            validation.isValid = false
            validation.errMsg = errMsg
        }
        
        return validation
    }
    
    func validateSoGiayTo(required: Bool = false) -> ValidateResult {
        let validation = ValidateResult()
        
        if self.count > 12 {
            validation.isValid = false
            validation.errMsg = "Không nhập quá 12 ký tự."
        } else if required && self.count == 0 {
            validation.isValid = false
            validation.errMsg = "Không để trống"
        }
        return validation
    }
    
    func validateSoBHYT(required: Bool = false) -> ValidateResult {
        let validation = ValidateResult()
        
        if self.count > 0 {
            let bhytRegEx = "[A-Z]{2}[1-5][0-9][0-9]\\d{10}"
            let bhytCheck = NSPredicate(format:"SELF MATCHES %@", bhytRegEx)
            if !bhytCheck.evaluate(with: self) {
                validation.isValid = false
                validation.errMsg = "Số BHYT không đúng định dạng"
            }
        } else if required {
            validation.isValid = false
            validation.errMsg = "Không để trống"
        }
        
        return validation
    }
    
    func validateMST(required: Bool = false) -> ValidateResult {
        let validation = ValidateResult()
        
        if self.count > 0 {
            let bhytRegEx = "[0-9]{10}-[0-9]{3}|[0-9]{10}"
            let bhytCheck = NSPredicate(format:"SELF MATCHES %@", bhytRegEx)
            if !bhytCheck.evaluate(with: self) {
                validation.isValid = false
                validation.errMsg = "MST không đúng định dạng"
            }
        } else if required {
            validation.isValid = false
            validation.errMsg = "Không để trống"
        }
        
        return validation
    }
    
    func validateSoSim10(required: Bool = false) -> ValidateResult {
        let validation = ValidateResult()
        
        if self.count > 0 {
            let bhytRegEx = "[0-9]{10}"
            let bhytCheck = NSPredicate(format:"SELF MATCHES %@", bhytRegEx)
            if !bhytCheck.evaluate(with: self) {
                validation.isValid = false
                validation.errMsg = "Số SIM không đúng định dạng"
            }
        } else if required {
            validation.isValid = false
            validation.errMsg = "Số SIM không được để trống"
        }
        
        return validation
    }
}
