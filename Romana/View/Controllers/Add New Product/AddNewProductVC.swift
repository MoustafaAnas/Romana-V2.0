import UIKit
import FTIndicator

class AddNewProductVC: UIViewController {

    @IBOutlet weak var productNameTxtField: UITextField!
    @IBOutlet weak var productPriceTxtField: UITextField!
    @IBOutlet weak var productUnitTxtField: UITextField!
    @IBOutlet weak var productQuantTxtField: UITextField!
    
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var prooductUnitLbl: UILabel!
    @IBOutlet weak var productIdLbl: UILabel!
    @IBOutlet weak var productQuantLbl: UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var productNamePickerView: UIPickerView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var offeredTotalPriceLbl: UILabel!
    
    var productNameDropDownMenu = ["Pepsi", "Sugar", "Tea"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupToHideKeyboardOnTapOnView()
        
        productNameTxtField.setPadding()
        productPriceTxtField.setPadding()
        productUnitTxtField.setPadding()
        productQuantTxtField.setPadding()
        
        backBtn()
        
        setupTxtFieldDelegates()
        productNameTxtField.addRightIcon(icon: UIImage(systemName: "arrow.down")!, tintColor: .brown)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Add Offered Price"
        tabBarController?.tabBar.isHidden = true
        navigationItem.backButtonTitle = ""
        productNameTxtField.text = ""
        productPriceTxtField.text = ""
        productQuantTxtField.text = ""
        productUnitTxtField.text = ""
        self.customizeNavBar(navBarimage: "tabBarPic", navBarTintColor: .white, titleColor: .white)
    }
    
    // MARK: - Customize Back Button
    func backBtn() {
        let backBtn = UIBarButtonItem()
        backBtn.image = UIImage(systemName: "chevron.backward")
        backBtn.action = #selector(backBtnIsPressed)
        backBtn.target = self
        navigationItem.leftBarButtonItem = backBtn
    }
    
    // Back Button Action 
   @objc func backBtnIsPressed () {
        tabBarController?.selectedIndex = 0
    }
    
    // MARK: - Add Button
    @IBAction func addBtnPressed(_ sender: Any) {
        
        FTIndicator.showProgress(withMessage: "")
        
        if productNameLbl.text != "" && productPriceTxtField.text != "" && productQuantTxtField.text != "" && prooductUnitLbl.text != "" {
            
        productNameLbl.text = productNameTxtField.text
        productPriceLbl.text = productPriceTxtField.text
        productQuantLbl.text = productQuantTxtField.text
        prooductUnitLbl.text = productUnitTxtField.text
        } else {
            FTIndicator.showError(withMessage: "Fill All Fields to Add Product")
        }
    }
    
    // MARK: - Confirm Button
    @IBAction func sendBtnPressed(_ sender: Any) {
            FTIndicator.showSuccess(withMessage: "Product Added Successfuly")
            tabBarController?.selectedIndex = 0
    }
    


}
