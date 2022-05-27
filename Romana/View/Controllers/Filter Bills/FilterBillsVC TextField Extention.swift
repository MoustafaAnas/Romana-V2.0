import UIKit

extension FilterBillsVC: UITextFieldDelegate {
    
    // MARK: - Setup TxtField
    func setupTxtField() {
        startingDateTextField.setPadding()
        endingDateTextField.setPadding()
        
        self.startingDateTextField.setInputViewDatePicker(target: self, selector: #selector(startingDateTextFieldTaped))
        self.endingDateTextField.setInputViewDatePicker(target: self, selector: #selector(endingDateTextFieldTaped))
    }
    
    // MARK: - Tapping Starting Date TextField in FilterView
    @objc func startingDateTextFieldTaped() {
        if let datePicker = self.startingDateTextField.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.dateStyle = .medium // 2-3
            self.startingDateTextField.text = dateformatter.string(from: datePicker.date) //2-4
        }
        self.startingDateTextField.resignFirstResponder() // 2-5
    }
    
    // MARK: - Tapping Ending Date TextField in FilterView
    @objc func endingDateTextFieldTaped() {
        if let datePicker = self.endingDateTextField.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.dateStyle = .medium // 2-3
            self.endingDateTextField.text = dateformatter.string(from: datePicker.date) //2-4
        }
        self.endingDateTextField.resignFirstResponder() // 2-5
    }
}
