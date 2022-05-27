import UIKit
import Alamofire
import FTIndicator

class SignUpVC: UIViewController {
    
    @IBOutlet weak var haveAccountBtn: UIButton!
    @IBOutlet weak var ccommericalRegBtn: UIButton!
    @IBOutlet weak var licenseBtn: UIButton!
    @IBOutlet weak var companyNameTxtField: UITextField!
    @IBOutlet weak var taxNumberTxtField: UITextField!
    @IBOutlet weak var commRegisterationNoTxtField: UITextField!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmPasswordTxtField: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    
    var commericalRegImg: UIImage?
    var licenseImg: UIImage?
    
    var presenter: SignupPresnter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign up"
        navigationItem.backButtonTitle = ""
        self.setupToHideKeyboardOnTapOnView()
        
        setupPresenter()
        
        companyNameTxtField.setPadding()
        taxNumberTxtField.setPadding()
        commRegisterationNoTxtField.setPadding()
        phoneNumberTxtField.setPadding()
        emailTxtField.setPadding()
        passwordTxtField.setPadding()
        confirmPasswordTxtField.setPadding()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        navigationController?.customizeNavBar(navBarimage: "", navBarTintColor: .brown, titleColor: .black)
    }
    
    // MARK: - Sign up Button
    @IBAction func signupBtnPressed(_ sender: Any) {
        
        let isEmailAddressValid = self.isValidEmailAddress(emailAddressString: emailTxtField.text!)
        
        if isEmailAddressValid
        {
            print("Email address is valid")
            
            presenter.signupApi(phoneNumber: phoneNumberTxtField.text!, password: passwordTxtField.text!, CompanyName: companyNameTxtField.text!, ComericalNumber: commRegisterationNoTxtField.text!, email: emailTxtField.text!, commericalRegImg: commericalRegImg ?? UIImage(), licenseImg: licenseImg ?? UIImage())
        } else {
            print("Email address is not valid")
            FTIndicator.showError(withMessage: "Email is not Valid", userInteractionEnable: false)
        }
    }
    
    // MARK: - to insert Commerical Registeration photo Button
    @IBAction func CommercialRegBtnPressed(_ sender: Any) {
        ccommericalRegBtn.isEnabled = false
        showPhotoAlert()
    }
    
    // MARK: - to insert license photo Button
    @IBAction func licenseUploadBtnPressed(_ sender: Any) {
        licenseBtn.isEnabled = false
        showPhotoAlert()
    }

    // MARK: - Login Button
    @IBAction func LoginBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    


}

