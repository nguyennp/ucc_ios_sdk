//
//  MySkyTextField.swift
//  MobileSCSS
//
//  Created by Hieu Tran on 9/3/20.
//  Copyright © 2020 VNPT IT 3. All rights reserved.
//

import UIKit

protocol MySkyDelegate: UITextFieldDelegate {
    func onEditingChanged(_ sender: MySkyTextField)
    func onEndEditing(_ sender: MySkyTextField)
    func onClear(_ sender: MySkyTextField)
    func onShouldBeginEditing(_ sender: MySkyTextField) -> Bool
}

extension MySkyDelegate {
    func onEditingChanged(_ sender: MySkyTextField) {
        /* return a default value or just leave empty */
    }
    func onEndEditing(_ sender: MySkyTextField) {
        /* return a default value or just leave empty */
    }
    func onClear(_ sender: MySkyTextField) {
        /* return a default value or just leave empty */
    }
    func onShouldBeginEditing(_ sender: MySkyTextField) -> Bool {
        /* return a default value or just leave empty */
        return true
    }
}

class MySkyTextField: SkyFloatingLabelTextField {
    override var text: String? {
        didSet {
            self.errorMessage = ""
        }
    }
    
    open var textFormat: String?
    open var textSeparator: String = ", "
    open var textRightView: String?
    
    //Added by Tran Vu Hieu 13.4.2019
    //Luu thong tin indexPath
    var indexPath: IndexPath?
    
    weak var skyDelegate: MySkyDelegate?
    override weak var delegate: UITextFieldDelegate? {
        didSet {
            self.skyDelegate = delegate as? MySkyDelegate
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleVisible(true)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setTitleVisible(true)
    }
    
    @objc func clear() {
        self.text = ""
        self.skyDelegate?.onClear(self)
    }
    
    @objc func actRightButton() {
        self.becomeFirstResponder()
    }
    
    override func editingChanged() {
        self.errorMessage = ""
        super.editingChanged()
        self.skyDelegate?.onEditingChanged(self)
    }
    
    func validate(_ type: ValidateType, required: Bool = false, isShowErr: Bool = true, isShake: Bool = true) -> ValidateResult {
        let validation = self.text!.validate(type, required: required)
        
        if !validation.isValid && isShowErr {
            if isShake {
                self.shakeError(validation.errMsg)
            } else {
                self.errorMessage = validation.errMsg
            }
        } else if validation.isValid {
            self.errorMessage = ""
        }
        
        return validation
    }
}
