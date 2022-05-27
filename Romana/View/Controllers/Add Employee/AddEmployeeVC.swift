import UIKit
import FTIndicator

class AddEmployeeVC: UIViewController {

    @IBOutlet weak var chosenPermissionsCV: UICollectionView!
    @IBOutlet weak var employeeNameTxtField: UITextField!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var emailAddrTxtField: UITextField!
    @IBOutlet weak var employeeAccesabilityTxtField: UITextField!
    @IBOutlet weak var employeePasswordTxtField: UITextField!
    @IBOutlet weak var passwordConfirmitionTxtField: UITextField!
    @IBOutlet weak var addEmpBtn: UIButton!
    @IBOutlet weak var userPermissionsPickerView: UIPickerView!
    @IBOutlet weak var userPermissionsPVHeightConst: NSLayoutConstraint!

    var userPermissionsDropDownMenu = [String]()
    var chosenPermissionsArr = [String]()
    var userItem: UsersDataModel!
    var titleVC = ""
    var titleBtn = ""
    
    var presenter: AddEmployeePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titleVC
        addEmpBtn.setTitle(titleBtn, for: .normal)
        navigationItem.backButtonTitle = ""
        self.setupToHideKeyboardOnTapOnView()
        
        setupPresenter()
        
        // Getting Permissions API
        presenter.getPermissionsApi()
        
        setupVC()
        hideCollectionView()
        
        setupCollectionView()
        
        setupTxtFieldDelegate()
        
        employeeNameTxtField.setPadding()
        phoneNumberTxtField.setPadding()
        emailAddrTxtField.setPadding()
        employeeAccesabilityTxtField.setPadding()
        employeePasswordTxtField.setPadding()
        passwordConfirmitionTxtField.setPadding()
        
        employeeAccesabilityTxtField.addRightIcon(icon: UIImage(systemName: "arrow.down")!, tintColor: .brown)
    }
    
    // MARK: - Setting up ViewController
    func setupVC() {
        if titleVC == "Edit Employee Info" {
            employeePasswordTxtField.isHidden = true
            passwordConfirmitionTxtField.isHidden = true
            employeeNameTxtField.text = userItem?.name
            phoneNumberTxtField.text = userItem?.phone
            emailAddrTxtField.text = userItem?.email
            chosenPermissionsArr = userItem!.permissions!
        }
        else {
            employeePasswordTxtField.isHidden = false
            passwordConfirmitionTxtField.isHidden = false
        }
    }
    
    // MARK: - Hiding CollectionView If items is 0
    func hideCollectionView() {
        
        UIView.animate(withDuration: 0.7) {
            if self.chosenPermissionsArr.count == 0 {
                self.chosenPermissionsCV.isHidden = true
                self.chosenPermissionsCV.alpha = 0
            }
            else {
                self.chosenPermissionsCV.isHidden = false
                self.chosenPermissionsCV.alpha = 1
            }
            self.view.layoutIfNeeded()
        }

    }
    
    // MARK: - Add/Edit Employee Data Button
    @IBAction func addEmployeeBtnPressed(_ sender: Any) {
        
        // Edit Employee Data
        if titleVC == "Edit Employee Info" {
            if employeeNameTxtField.text != "" && phoneNumberTxtField.text != "" && emailAddrTxtField.text != "" {
                
                presenter.editUsersApi(userID: userItem?.id ?? 0, userName: employeeNameTxtField.text!, phoneNumber: phoneNumberTxtField.text!, email: emailAddrTxtField.text!, permissions: chosenPermissionsArr)
            }
            else {
                FTIndicator.showError(withMessage: "Fill all fields correctly")
            }
        }
        
        // Add New Employee
        else {
            if employeePasswordTxtField.text != "" && employeePasswordTxtField.text == passwordConfirmitionTxtField.text && employeeNameTxtField.text != "" && phoneNumberTxtField.text != "" && emailAddrTxtField.text != "" {
            
                presenter.addUsersApi(userName: employeeNameTxtField.text!, phoneNumber: phoneNumberTxtField.text!, email: emailAddrTxtField.text!, permissions: chosenPermissionsArr, password: employeePasswordTxtField.text!)
            }
            
            else {
                FTIndicator.showError(withMessage: "Fill all fields correctly")
            }
        }

    }
    
}
