import UIKit

extension CodeActivationVC: UITextFieldDelegate {
    
    // MARK: - Setup TextField Delegates
    func setupTxtFieldDelegates(){
        input1.delegate = self
        input2.delegate = self
        input3.delegate = self
        input4.delegate = self
    }
    
    // MARK: - Add TextField Action
    func addTxtFieldAction(){
        input1.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        input2.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        input3.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        input4.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    // MARK: - After Changing TextField Value, Moving From TextField To Another
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        let text = textField.text
        
        if (text?.utf16.count)! >= 1{
            switch textField{
            case input1:
                input2.becomeFirstResponder()
            case input2:
                input3.becomeFirstResponder()
            case input3:
                input4.becomeFirstResponder()
            case input4:
                input4.resignFirstResponder()
            default:
                break
            }
        }else{
        }
    }
}
