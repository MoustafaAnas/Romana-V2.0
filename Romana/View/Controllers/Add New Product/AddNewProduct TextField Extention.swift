import UIKit

extension AddNewProductVC: UITextFieldDelegate {
    
    // MARK: - Setting up TxtField Delegates
    func setupTxtFieldDelegates() {
        productNameTxtField.delegate = self
    }
    
    // MARK: - Action When Begin Editing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.productNameTxtField {
            self.productNamePickerView.isHidden = false
            textField.endEditing(true)
        }
    }
}
