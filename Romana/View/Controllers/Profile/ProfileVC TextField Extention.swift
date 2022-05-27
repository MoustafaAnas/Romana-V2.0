//
//  ProfileVC TextField Extention.swift
//  Romana
//
//  Created by Moustafa Anas on 27/03/2022.
//

import UIKit

extension ProfileVC: UITextFieldDelegate {
    
    // MARK: - Setup up TxtField Delegates
    func setupTxtFieldDelegates(){
        passwordTxtField.delegate = self
    }
    
    // MARK: - Cancelling TextField Editing and Allowing Clicking on Button
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.passwordTxtField {
            textField.endEditing(true)
        }
    }
    
    // MARK: - Add Button To TextField
    func addBtnToTextField(textField: UITextField, title: String) {
        let button = UIButton(frame: CGRect(x: 10, y: (textField.frame.height)/2 - 5, width: 50, height: 10))
        button.titleLabel?.font =  UIFont(name: "Arial", size: 9)
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.brown, for: .normal)
        button.addTarget(self, action: #selector(self.txtFieldBtnAction), for: .touchUpInside)
        textField.rightViewMode = .always
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 65, height: textField.frame.height))
        view.addSubview(button)
        textField.rightView = view
    }
    
    // TextField Button Action
    @objc func txtFieldBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
        self.present(vc, animated: true)
    }
}
