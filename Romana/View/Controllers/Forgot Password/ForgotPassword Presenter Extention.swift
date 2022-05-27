
extension ForgotPasswordVC: ForgotPasswordView {
    
    // MARK: - Setting up Presenter
    func setupPresenter(){
        presnter = ForgotPasswordPresnter(delegate: self)
    }
    
    // MARK: - Go to CodeActivationVC Method
    func goToCodeActivation() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CodeActivationVC") as! CodeActivationVC
        self.navigationController?.pushViewController(vc, animated: true)
        vc.phoneNumber = self.phoneNumbTextFiled.text!
        
        self.phoneNumbTextFiled.text = ""
    }
    
    
}
