import UIKit
import Kingfisher
import FTIndicator

class ProfileVC: UIViewController {
 
    
    @IBOutlet weak var staticDataViewHeightConst: NSLayoutConstraint!
    @IBOutlet weak var containerDataViewHeightConst: NSLayoutConstraint!
    @IBOutlet weak var changeProfilePicBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var profileNavbarView: UIView!
    
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var mobileNumberTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var locationTxtField: UITextField!

    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var companyNameTxtField: UITextField!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var commericalRegTxtField: UITextField!
    
    var presenter: ProfilePresnter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        navigationItem.backButtonTitle = ""
        self.setupToHideKeyboardOnTapOnView()
        
        setupTxtFieldDelegates()
        setupProfile()
        
        setupPresenter()
        
        companyNameTxtField.setPadding()
        userNameTxtField.setPadding()
        commericalRegTxtField.setPadding()
        phoneNumberTxtField.setPadding()
        mobileNumberTxtField.setPadding()
        emailTxtField.setPadding()
        passwordTxtField.setPadding()
        locationTxtField.setPadding()
        
        editBtn()
        
        locationTxtField.addRightIcon(icon: UIImage(systemName: "mappin.and.ellipse")!, tintColor: .brown)
        addBtnToTextField(textField: passwordTxtField, title: "Change")

        
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Setting up Profile Image
    func presentProfileImage(photoUrl : String){
        profileImg.kf.indicatorType = .activity
        guard let url = URL(string: photoUrl) else {return}
        profileImg.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
    }
    
    // MARK: - Setting up Profile
    func setupProfile() {
        guard let userEmail = UserDefaults.standard.object(forKey: "email") as? String else{return }
        guard let userMobilePhone = UserDefaults.standard.object(forKey: "phone") as? String else{return }
        guard let userLandline = UserDefaults.standard.object(forKey: "landline") as? String else{return }
        guard let userLocation = UserDefaults.standard.object(forKey: "address") as? String else{return }
        guard let userImage = UserDefaults.standard.object(forKey: "image") as? String else{return }
        guard let companyName = UserDefaults.standard.object(forKey: "companyName") as? String else{return }
        guard let commericalReg = UserDefaults.standard.object(forKey: "commercialNumber") as? String else{return }
        guard let userName = UserDefaults.standard.object(forKey: "name") as? String else{return }
        
        companyNameTxtField.text = companyName
        userNameTxtField.text = userName
        commericalRegTxtField.text = commericalReg
        
        phoneNumberTxtField.text = userMobilePhone
        mobileNumberTxtField.text = userLandline
        emailTxtField.text = userEmail
        passwordTxtField.text = "123456"
        locationTxtField.text = userLocation
        presentProfileImage(photoUrl: userImage)
      
    }

    // MARK: - Setting up Edit Button
    func editBtn() {
        let editBtn = UIBarButtonItem()
        editBtn.image = UIImage(systemName: "pencil")
        editBtn.action = #selector(editBtnIsPressed)
        editBtn.target = self
        navigationItem.rightBarButtonItem = editBtn
    }
    
    // Edit Button Action
   @objc func editBtnIsPressed () {
       UIView.animate(withDuration: 0.4) {
        self.staticDataViewHeightConst.constant = 0
        self.containerDataViewHeightConst.constant = 470
        self.view.layoutIfNeeded()
       }
       phoneNumberTxtField.isEnabled = true
       mobileNumberTxtField.isEnabled = true
       emailTxtField.isEnabled = true
       locationTxtField.isEnabled = true
       self.title = "Edit Profile"
       self.changeProfilePicBtn.isHidden = false
       self.saveBtn.isHidden = false
       self.navigationItem.rightBarButtonItem?.isEnabled = false
       self.navigationItem.rightBarButtonItem?.image = UIImage()
    }
    
    // MARK: - Change Profile Button
    @IBAction func changeProfilePicBtnIsPressed(_ sender: Any) {
        getPhoto(type: .photoLibrary)
    }
    
    // MARK: - Save Button
    @IBAction func saveBtnIsPressed(_ sender: Any) {
        if phoneNumberTxtField.text != "" && mobileNumberTxtField.text != "" && locationTxtField.text != "" && emailTxtField.text != "" {
        
        let isEmailAddressValid = self.isValidEmailAddress(emailAddressString: emailTxtField.text!)
        
        if isEmailAddressValid
        {
            print("Email address is valid")
            
            presenter.updateProfileApi(phoneNumber: phoneNumberTxtField.text!, mobileNumber: mobileNumberTxtField.text!, address: locationTxtField.text!, email: emailTxtField.text!)
        } else {
            print("Email address is not valid")
            FTIndicator.showError(withMessage: "Invalid Email Address", userInteractionEnable: false)
            }
        } else {
            FTIndicator.showError(withMessage: "Fill All Fields")
        }
    }
    

  
    

}





