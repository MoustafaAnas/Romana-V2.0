import UIKit

class PolicyDetalisVC: UIViewController {

    @IBOutlet weak var policyID: UILabel!
    @IBOutlet weak var payWith: UILabel!
    @IBOutlet weak var policyValue: UILabel!
    @IBOutlet weak var policyDate: UILabel!
    
    @IBOutlet weak var bankNameTxt: UITextField!
    @IBOutlet weak var acountNumberTxt: UITextField!
    @IBOutlet weak var processDateTxt: UITextField!
    
    @IBOutlet weak var processPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Policy Details"
        navigationItem.backButtonTitle = ""
        self.setupToHideKeyboardOnTapOnView()
        
        bankNameTxt.setPadding()
        acountNumberTxt.setPadding()
        processDateTxt.setPadding()
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }

}
