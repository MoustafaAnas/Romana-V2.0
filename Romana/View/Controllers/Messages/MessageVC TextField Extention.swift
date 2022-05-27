import UIKit

extension MessagesVC: UITextFieldDelegate {
    
    // MARK: - Setting up Txt Field
    func setupTextField(){
        msgContentTxtField.delegate = self
    }
    
    // MARK: - Action When Begin Editing TextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
 
        UIView.animate(withDuration: 0.5) {
            self.containerWidthConst.constant = 0
            self.btnContainerView.alpha = 0
            self.sendBtnWidthConst.constant = 32
            self.view.layoutIfNeeded()
        }

    }

    // MARK: - Action After Ending Editing TextField
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.bottomConst.constant = 40
            self.sendBtnWidthConst.constant = 0
            self.containerWidthConst.constant = 70
            self.btnContainerView.alpha = 1
            self.view.layoutIfNeeded()
        }
        
    }
}
