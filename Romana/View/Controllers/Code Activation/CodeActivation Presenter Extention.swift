
extension CodeActivationVC: CodeActivationView {
    
    // MARK: - Setting up Presenter
    func setupPresenter() {
        presenter = CodeActivationPresnter(delegate: self)
    }
    
    // MARK: - Go to NewPasswordVC Method
    func goToNewPassword() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewPasswordVC") as? NewPasswordVC
        self.navigationController?.pushViewController(vc!, animated: true)
        vc?.phoneNumber = self.phoneNumber
        vc?.code = self.codeVerification
    }
    
}
