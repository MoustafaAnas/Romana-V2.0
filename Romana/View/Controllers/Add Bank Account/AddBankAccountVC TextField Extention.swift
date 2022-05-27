import UIKit

extension AddBankAccountVC: UITextFieldDelegate {
    
    // MARK: - Settup TxtField Delegates
    func setupTxtFieldDelegates(){
        bankNameTxtField.delegate = self
    }
    
    // MARK: - Action After Tapping on TextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.bankNameTxtField {
            
            UIView.animate(withDuration: 0.4) {
                self.bankNamesPVHeightConst.constant = 120
                self.view.layoutIfNeeded()
            }
            
            textField.endEditing(true)
        }
    }
}
