import UIKit
import AVFoundation

class AddProductVC: UIViewController {

    @IBOutlet weak var productParCode: UITextField!
    @IBOutlet weak var productNameTxtField: UITextField!
    @IBOutlet weak var productUnitTxtField: UITextField!
    @IBOutlet weak var productPriceTxtField: UITextField!
    @IBOutlet weak var productExpDateTxtField: UITextField!
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var uploadImgBtn: UIButton!
    
    let session: AVCaptureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer!
    var highlightView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add Product"
        navigationItem.backButtonTitle = ""
        self.setupToHideKeyboardOnTapOnView()
        
        productParCode.setPadding()
        productNameTxtField.setPadding()
        productUnitTxtField.setPadding()
        productPriceTxtField.setPadding()
        productExpDateTxtField.setPadding()
        
        setupTxtFieldDelegate()
        productExpDateTxtField.addRightIcon(icon: UIImage(systemName: "calendar")!, tintColor: .brown)
        self.productExpDateTxtField.setInputViewDatePicker(target: self, selector: #selector(textFieldTaped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Add Product Button
    @IBAction func addBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Getting Product Photo Button
    @IBAction func uploadImg(_ sender: Any) {
        getPhoto(type: .photoLibrary)
    }

}
