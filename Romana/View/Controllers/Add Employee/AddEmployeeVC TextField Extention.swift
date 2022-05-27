//
//  AddEmployeeVC TextField Extention.swift
//  Romana
//
//  Created by Moustafa Anas on 27/03/2022.
//

import UIKit

extension AddEmployeeVC: UITextFieldDelegate {
    
    // MARK: - Setting up TxtField Delegates
    func setupTxtFieldDelegate(){
        employeeAccesabilityTxtField.delegate = self
    }
    
    // MARK: - Action After Tapping TextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.employeeAccesabilityTxtField {
            
            UIView.animate(withDuration: 0.4) {
                self.userPermissionsPVHeightConst.constant = 120
                self.view.layoutIfNeeded()
            }
            
            textField.endEditing(true)
        }
    }

}
