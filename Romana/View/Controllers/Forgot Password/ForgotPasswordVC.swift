import UIKit
import FTIndicator

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var phoneNumbTextFiled: UITextField!
    @IBOutlet weak var nxtBtn: UIButton!
    
    var presnter: ForgotPasswordPresnter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Forgot Password"
        navigationItem.backButtonTitle = ""
        self.setupToHideKeyboardOnTapOnView()
        
        setupPresenter()
        
        phoneNumbTextFiled.setPadding()
        
        phoneNumbTextFiled.addRightIcon(icon: UIImage(systemName: "iphone.homebutton")!, tintColor: .brown)
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
 
    // MARK: - Go Next Button
    @IBAction func continueBtnPressed(_ sender: Any) {
        
        if phoneNumbTextFiled.text != "" {
            presnter.forgotPasswordApi(phoneNumber: phoneNumbTextFiled.text!)
        } else {
            FTIndicator.showError(withMessage: "Enter Your Phone Number")
        }
    }
    

}
