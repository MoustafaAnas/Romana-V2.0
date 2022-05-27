//login with
//phone: 01118070518
//password: 123456

import UIKit
import FTIndicator

class LoginVC: UIViewController {
  
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    
    var prsenter = LoginPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = ""
        self.setupToHideKeyboardOnTapOnView()
        
        phoneNumberTextField.setPadding()
        passwordTextField.setPadding()
    
        phoneNumberTextField.addRightIcon(icon: UIImage(systemName: "iphone.homebutton")!, tintColor: .brown)
        passwordTextField.addRightIcon(icon: UIImage(systemName: "lock")!, tintColor: .brown)
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        phoneNumberTextField.text = ""
        passwordTextField.text = ""
        navigationController?.customizeNavBar(navBarimage: "", navBarTintColor: .brown, titleColor: .black)
    }
    
    // MARK: - Forgot Password Button
    @IBAction func forgetPasswordBtnPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Login Button
    @IBAction func loginBtnPressed(_ sender: Any) {
        
         if phoneNumberTextField.text != "" && passwordTextField.text != "" {
            prsenter.loginApi(phoneNumber: phoneNumberTextField.text!, Password: passwordTextField.text!)
        } else {
            FTIndicator.showError(withMessage: "Enter Your Phone Number or Password")
        }
    }
    
    // MARK: - Register Button
    @IBAction func registerBtnPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        navigationController?.pushViewController(vc, animated: true)
    }
 
}

