
extension AddBankAccountVC: AddBankView {
    
    // MARK: - Setting up Presenter
    func setupPresenter() {
        presenter = AddBankPresnter(delegate: self)
    }
    
    // MARK: - Go back to BankAccountsVC Method
    func goBackToBankAccounts() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
