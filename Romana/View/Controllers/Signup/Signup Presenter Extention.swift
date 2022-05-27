
extension SignUpVC: SignupView {

    // MARK: - Setting up presenter
    func setupPresenter() {
        presenter = SignupPresnter(delegate: self)
    }
    
    // MARK: - Go back to LoginVC Method
    func backToLogin() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
