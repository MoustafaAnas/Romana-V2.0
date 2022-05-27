// MARK: - NewPassword Protocol
protocol NewPasswordView: AnyObject {
    func backToLogin()
}

// MARK: - NewPassword Presenter
class NewPasswordPresnter {
    
    // Creating a Delegate Variable
    private weak var delegate: NewPasswordView?
    
    // Setting up Delegate
    init(delegate: NewPasswordView) {
        self.delegate = delegate
    }
    
    // ResetPassword Api Func
    func resetPasswordApi(phoneNumber: String, code: String, newPassword: String) {
        API.resetPasswordCodeNetwork(Url: URLs.newPassword_Url, phoneNumber: phoneNumber, code: code, password: newPassword) { error, success in
            self.delegate?.backToLogin()
        }
    }
}
