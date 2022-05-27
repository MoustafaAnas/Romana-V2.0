import UIKit
import FTIndicator

class AddBankAccountVC: UIViewController {

    @IBOutlet weak var bankNameTxtField: UITextField!
    @IBOutlet weak var shopOwnerNameTxtField: UITextField!
    @IBOutlet weak var accountNumberTxtField: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var bankNamesPickerView: UIPickerView!
    
    @IBOutlet weak var bankNamesPVHeightConst: NSLayoutConstraint!
    
    var bankNamesDropDownMenu = ["Bank Al-ahly", "Bank QNB", "Bank Al-raghy"]
    var bankItems: BanksDataClass?
    var titleVC = ""
    var addBtnTitle = ""
    
    var presenter: AddBankPresnter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = titleVC
        navigationItem.backButtonTitle = ""
        self.setupToHideKeyboardOnTapOnView()
        setupVC()
        
        setupPresenter()
        
        bankNameTxtField.setPadding()
        shopOwnerNameTxtField.setPadding()
        accountNumberTxtField.setPadding()
        
        setupTxtFieldDelegates()
        bankNameTxtField.addRightIcon(icon: UIImage(systemName: "arrow.down")!, tintColor: .brown)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        self.customizeNavBar(navBarimage: "", navBarTintColor: .brown, titleColor: .black)
    }
    
    // MARK: - Setting up ViewController
    func setupVC() {
        addBtn.setTitle(addBtnTitle, for: .normal)
        if titleVC == "Edit Bank Account" {
            bankNameTxtField.text = bankItems?.name
            shopOwnerNameTxtField.text = bankItems?.ownerName
            accountNumberTxtField.text = bankItems?.iban
        }
        else {
        
        }
    }

    // MARK: - Add Button
    @IBAction func addBtnPressed(_ sender: Any) {
        if titleVC == "Edit Bank Account" {
            updateBankAccount()
        } else {
            addBankAccount()
        }
    }
    
    // MARK: - Update Bank Account API
    func updateBankAccount() {
        if accountNumberTxtField.text != "" && bankNameTxtField.text != "" && shopOwnerNameTxtField.text != "" {
            presenter.updateBankAccountApi(accountID: bankItems?.id ?? 0, bankName: bankNameTxtField.text!, accountOwnerName: shopOwnerNameTxtField.text!, iban: accountNumberTxtField.text!)
            
        } else {
            FTIndicator.showError(withMessage: "Fill all fields correctly")
        }
    }
    
    // MARK: - Add Bank Account API
    func addBankAccount() {
        if accountNumberTxtField.text != "" && bankNameTxtField.text != "" && shopOwnerNameTxtField.text != "" {
            presenter.addBankAccountApi(bankName: bankNameTxtField.text!, accountOwnerName: shopOwnerNameTxtField.text!, iban: accountNumberTxtField.text!)
        } else {
            FTIndicator.showError(withMessage: "Fill all fields correctly")
        }
    }
    
}
