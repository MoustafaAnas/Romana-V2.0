import UIKit
import FTIndicator

extension AddEmployeeVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - No. of Sections in PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: - No. of Items in Section
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return userPermissionsDropDownMenu.count
    }
    
    // MARK: - Items Names in Section
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return userPermissionsDropDownMenu[row]
    }
    
    // MARK: - Action After Selecting Item
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if chosenPermissionsArr.contains(userPermissionsDropDownMenu[row]) {
            FTIndicator.showError(withMessage: "Already Chosen")
        }
        else {
            
            chosenPermissionsCV.performBatchUpdates {
                self.chosenPermissionsCV.insertItems(at: [IndexPath(row: chosenPermissionsArr.count-1, section: 0)])
            }
            self.chosenPermissionsArr.append(self.userPermissionsDropDownMenu[row])
            self.chosenPermissionsCV.reloadData()
        }
        self.hideCollectionView()
        UIView.animate(withDuration: 0.2) {
            self.userPermissionsPVHeightConst.constant = 0
            self.view.layoutIfNeeded()
        }
      
    }
}
