import UIKit
import FTIndicator

class NewPasswordVC: UIViewController {

    @IBOutlet weak var newPasswordTxtField: UITextField!
    @IBOutlet weak var reenterNewPasswordTxtField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    var phoneNumber = ""
    var code = ""
    
    var presenter: NewPasswordPresnter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Reset Password"
        navigationItem.backButtonTitle = ""
        self.setupToHideKeyboardOnTapOnView()
        
        setupPresenter()
        
        newPasswordTxtField.setPadding()
        reenterNewPasswordTxtField.setPadding()
        
    }

    // MARK: - Save NewPassword Button
    @IBAction func saveBtnPressed(_ sender: Any) {
   
        if newPasswordTxtField.text != "" && newPasswordTxtField.text == reenterNewPasswordTxtField.text {
            presenter.resetPasswordApi(phoneNumber: phoneNumber, code: code, newPassword: newPasswordTxtField.text!)
        } else {
            FTIndicator.showError(withMessage: "Passwords Fields is not same")
        }
  
    }
    
    
}
