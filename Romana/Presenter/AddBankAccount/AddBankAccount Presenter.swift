
// MARK: - AddBank Protocol
protocol AddBankView: AnyObject {
    func goBackToBankAccounts()
}

// MARK: - AddBank Presenter
class AddBankPresnter {
    
    // Creating A Delegate Variable
    private weak var delegate: AddBankView?
    
    // Setup Delegate
    init(delegate: AddBankView) {
        self.delegate = delegate
    }
    
    // Add Bank Account Api Func
    func addBankAccountApi(bankName: String, accountOwnerName: String, iban: String) {
        
        API.addBankCodeNetwork(bankName: bankName, accountOwnerName: accountOwnerName, iban: iban) { error, success in
            if success {
                self.delegate?.goBackToBankAccounts()
            }
        }
    }
    
    // Edit Bank Account Data Api Func
    func updateBankAccountApi(accountID: Int, bankName: String, accountOwnerName: String, iban: String) {
        
        API.updateBankCodeNetwork(accountID: accountID, bankName: bankName, accountOwnerName: accountOwnerName, iban: iban) { error, success in
            self.delegate?.goBackToBankAccounts()
        }
    }
}
