import UIKit

// MARK: - BankAccount Protocol
protocol BankAccountsView: AnyObject {
    func reloadBankAccounts()
    func deleteBankAccount(index: IndexPath)
    func goToEditBankAccounts(bank: BanksDataClass)
}

// MARK: - BankAccount Cell Protocol
protocol BankAccountsCellView {
    func setBankName (bankName: String)
    func setAccountNumber (accountNumber: String)
}

// MARK: - BankAccount Presenter
class BankAccountsPresenter {
    
    // Creating a Delegate Variable
    private weak var delegate: BankAccountsView?
    
    // Creating Object from BanksModel
    var cellItems: BanksModel?
    
    // Setting up Delegate
    init(delegate: BankAccountsView) {
        self.delegate = delegate
    }
    
    // Get Bank Accounts Api
    func getBankAccountsApi() {
        API.getBanksCodeNetwork(Url: URLs.banks_Url) { error, success, data in
            if success {
            self.cellItems = data
            self.delegate?.reloadBankAccounts()
            }
        }
    }
    
    // Delete Bank Account Api
    func deleteBankAccountsApi(index: IndexPath) {
        API.deleteBankCodeNetwork(id: (cellItems?.data[index.row].id)!) { error, success in
            if success {
                self.cellItems?.data.remove(at: index.row)
                self.delegate?.deleteBankAccount(index: index)
            } else {
                self.delegate?.reloadBankAccounts()
            }
        }
    }
    
    // Edit Bank Account Api
    func editBankAccount(index: Int) {
            guard let item = cellItems?.data[index] else {return}
            self.delegate?.goToEditBankAccounts(bank: item)
    }
    
    // Configure Cell
    func configureCell(cell: BankAccountsCellView, for index: Int) {
        guard let item = cellItems?.data[index] else {return}
        cell.setBankName(bankName: item.name ?? "")
        cell.setAccountNumber(accountNumber: item.iban ?? "")
    }
    
    // Get Number of Bank Accounts
    func getItemsCount() -> Int {
        return cellItems?.data.count ?? 0
    }
}


