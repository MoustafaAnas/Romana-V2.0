import UIKit
import FTIndicator

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var newPasswordTxtField: UITextField!
    @IBOutlet weak var confirmNewPasswordTxtField: UITextField!
    
    var presenter: ChangePasswordPresnter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPresenter()
        
        newPasswordTxtField.setPadding()
        confirmNewPasswordTxtField.setPadding()
    }
    

    // MARK: - Cancelling NewPassword View
    @IBAction func exitNewPasswordBtnPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // MARK: - Save NewPassword Button
    @IBAction func saveNewPasswordBtnPressed(_ sender: Any) {
        if newPasswordTxtField.text == confirmNewPasswordTxtField.text && newPasswordTxtField.text != "" {
       
            presenter.updateUserPasswordApi(password: newPasswordTxtField.text!)
        } else {
            FTIndicator.showError(withMessage: "Passwords is not equal")
        }
    }

}
