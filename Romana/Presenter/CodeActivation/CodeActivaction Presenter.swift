// MARK: - CodeActivation Protocol
protocol CodeActivationView: AnyObject {
    func goToNewPassword()
}

// MARK: - CodeActivation Presenter
class CodeActivationPresnter {
    
    // Creating Delegate Variable
    private weak var delegate: CodeActivationView?
    
    // Setting up Delegate
    init(delegate: CodeActivationView) {
        self.delegate = delegate
    }
    
    // CodeActivation Api Func
    func CodeActivationApi(phoneNumber: String, code: String) {
        API.codeActivationNetwork(Url: URLs.codeActivation_Url, phoneNumber: phoneNumber, code: code) { error, success in
            if success {
                self.delegate?.goToNewPassword()
            }
        }
    }
}
