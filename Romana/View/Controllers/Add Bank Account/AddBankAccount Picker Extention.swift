import UIKit

extension AddBankAccountVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - No. of Sections in PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: - No. Items in PickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return bankNamesDropDownMenu.count
    }
    
    // MARK: - Items Names in Section
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return bankNamesDropDownMenu[row]
    }
    
    // MARK: - Action After Selecting Item
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.bankNameTxtField.text = self.bankNamesDropDownMenu[row]
        
        UIView.animate(withDuration: 0.1) {
            self.bankNamesPVHeightConst.constant = 0
            self.view.layoutIfNeeded()
        }
}
    
}
