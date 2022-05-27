import UIKit
import FTIndicator

class CodeActivationVC: UIViewController {

    @IBOutlet weak var nxtBtn: UIButton!
    @IBOutlet weak var input4: UITextField!
    @IBOutlet weak var input3: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var timerLbl: UILabel!
    
    var codeVerification:String = ""
    var timer: Timer?
    var seenTimer = 59
    var phoneNumber = ""
    
    var presenter: CodeActivationPresnter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Forgot Password"
        navigationItem.backButtonTitle = ""
        self.setupToHideKeyboardOnTapOnView()
        
        setupPresenter()
        setupTxtFieldDelegates()
        addTxtFieldAction()
        
        timerLbl.text = "01:00"
        startTimer()
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
        seenTimer = 59
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
               input1.becomeFirstResponder()
    }
    
    // MARK: - Go Next Button
    @IBAction func continueBtnPressed(_ sender: Any) {
        
        getCodeVerification()
        if codeVerification != "" {
            presenter.CodeActivationApi(phoneNumber: phoneNumber, code: codeVerification)
            self.resetCodeVerfication()
        } else {
            FTIndicator.showError(withMessage: "Enter Verfication Code")
        }
        
    }
    
    // MARK: - Getting Code Verfication
    func getCodeVerification() {
       codeVerification.append(input1.text!)
       codeVerification.append(input2.text!)
       codeVerification.append(input3.text!)
       codeVerification.append(input4.text!)
       
       self.view.endEditing(true)
    }
    
    // MARK: - Reset Code verfication
    func resetCodeVerfication () {
            self.input1.text = ""
            self.input2.text = ""
            self.input3.text = ""
            self.input4.text = ""
            self.codeVerification = ""
            self.input1.becomeFirstResponder()
            seenTimer = 59

    }
    
}
