import UIKit

// MARK: - Sign up Protocol
protocol SignupView: AnyObject {
    func backToLogin()
}

// MARK: - Sign up Presenter
class SignupPresnter {
    
    // Creating a delegate Variable
    private weak var delegate: SignupView?
    
    // Setting up Delegate
    init(delegate: SignupView) {
        self.delegate = delegate
    }
    
    // Sign up Api Func
    func signupApi(phoneNumber: String, password: String, CompanyName:String, ComericalNumber:String,email: String,commericalRegImg: UIImage, licenseImg: UIImage) {
        API.signupCodeNetwork(phoneNumber: phoneNumber, password: password, CompanyName: CompanyName, ComericalNumber: ComericalNumber, email: email, commericalRegImg: commericalRegImg, licenseImg: licenseImg) { error, success in
            self.delegate?.backToLogin()
        }
   
    }
}
