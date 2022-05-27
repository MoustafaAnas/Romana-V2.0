import AnimatableReload

extension BankAccountsVC: BankAccountsView {
    
    // MARK: - Setting up Presenter
    func setupPresenter(){
        presenter = BankAccountsPresenter(delegate: self)
    }
    
    // MARK: - Reload Bank Accounts Method
    func reloadBankAccounts() {
        self.BankAccountsTV.reloadData()
        self.noDataToDisplayMsg(tableview: self.BankAccountsTV, tableViewDataArrCount: presenter.getItemsCount())
    }
    
    // MARK: - Delete Bank Account Action
    func deleteBankAccount(index: IndexPath) {
        self.BankAccountsTV.beginUpdates()
        self.BankAccountsTV.deleteRows(at: [index], with: .top)
        self.BankAccountsTV.endUpdates()
        self.noDataToDisplayMsg(tableview: self.BankAccountsTV, tableViewDataArrCount: presenter.getItemsCount())
    }
    
    // MARK: - Edit Bank Account Action
    func goToEditBankAccounts(bank: BanksDataClass) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddBankAccountVC") as! AddBankAccountVC
        self.navigationController?.pushViewController(vc, animated: true)
        vc.titleVC = "Edit Bank Account"
        vc.addBtnTitle = "Edit"

        vc.bankItems = bank
        
        self.BankAccountsTV.reloadData()
    }
    
}
