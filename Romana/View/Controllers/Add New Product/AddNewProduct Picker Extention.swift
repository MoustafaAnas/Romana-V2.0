import UIKit

extension AddNewProductVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - No. Of Sections in PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: - No. Of items in Section
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return productNameDropDownMenu.count
    }
    
    // MARK: - Items Name in PickerView
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return productNameDropDownMenu[row]
    }
    
    // MARK: - Action After Selecting Item
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.productNameTxtField.text = self.productNameDropDownMenu[row]
        self.productNamePickerView.isHidden = true
    }
}
