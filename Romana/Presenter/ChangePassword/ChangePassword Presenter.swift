import UIKit

// MARK: - ChangePassword Protocol
protocol ChangePasswordView: AnyObject {
    func goBackToEditProfile()
}

// MARK: - ChangePassword Presenter
class ChangePasswordPresnter {
    
    // Creating a Delegate Variable
    private weak var delegate: ChangePasswordView?
    
    // Setup Delegate
    init(delegate: ChangePasswordView) {
        self.delegate = delegate
    }
    
    // Update User Paswword Api Func
    func updateUserPasswordApi(password: String) {
        
        API.updateUserPasswordCodeNetwork(Url: URLs.profile_Url, password: password) { error, success, data in
            if success {
                self.delegate?.goBackToEditProfile()
            }
        }
    }

}
