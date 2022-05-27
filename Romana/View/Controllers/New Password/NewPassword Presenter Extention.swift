
extension NewPasswordVC: NewPasswordView {

    // MARK: - Setting up presenter
    func setupPresenter() {
        presenter = NewPasswordPresnter(delegate: self)
    }
    
    // MARK: - Go back to LoginVC Method
    func backToLogin() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
