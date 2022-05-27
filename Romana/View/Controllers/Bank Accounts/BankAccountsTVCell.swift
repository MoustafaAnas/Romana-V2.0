import UIKit

class BankAccountsTVCell: UITableViewCell, BankAccountsCellView {

    @IBOutlet weak var bankNameLbl: UILabel!
    @IBOutlet weak var accountNumberLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Setting up Cell
    func setBankName(bankName: String) {
        self.bankNameLbl.text = bankName
    }
    
    func setAccountNumber(accountNumber: String) {
        self.accountNumberLbl.text = accountNumber
    }
    
}
