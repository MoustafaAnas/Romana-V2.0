import UIKit

// MARK: - ForgotPassword Protocol
protocol ForgotPasswordView: AnyObject {
    func goToCodeActivation()
}

// MARK: - ForgotPassword Presenter
class ForgotPasswordPresnter {
    
    // Creating a Delegate Variable
    private weak var delegate: ForgotPasswordView?
    
    // Setting up Delegate
    init(delegate: ForgotPasswordView) {
        self.delegate = delegate
    }
    
    // ForgotPassword Api Func
    func forgotPasswordApi(phoneNumber: String) {
    API.forgotPasswordCodeNetwork(Url: URLs.forgotPassword_Url, phoneNumber: phoneNumber) { error, success in
        if success {
            self.delegate?.goToCodeActivation()
        }
    }
    }
}
