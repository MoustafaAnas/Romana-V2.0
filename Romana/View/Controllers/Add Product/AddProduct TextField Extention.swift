import UIKit

extension AddProductVC: UITextFieldDelegate {
    
    // MARK: - Setting up TxtField Delegate
    func setupTxtFieldDelegate(){
        productParCode.delegate = self
        
        productExpDateTxtField.delegate = self
    }
    
    // MARK: - TextField Action After Tapping it
    @objc func textFieldTaped() {
        if let datePicker = self.productExpDateTxtField.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.dateStyle = .medium // 2-3
            self.productExpDateTxtField.text = dateformatter.string(from: datePicker.date) //2-4
        }
        self.productExpDateTxtField.resignFirstResponder() // 2-5
    }
    
    // MARK: - Action After Tapping TextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.productParCode {
            
            customizeBarCode()
            
            textField.endEditing(true)
        }
    }

}
