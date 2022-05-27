import UIKit

class BillsTVCell: UITableViewCell, BillsCellView {
 
    @IBOutlet weak var processImage: UIImageView!
    @IBOutlet weak var itemsNumber: UILabel!
    @IBOutlet weak var itemID: UILabel!
    @IBOutlet weak var processDate: UILabel!
    @IBOutlet weak var processValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Configure Cell Data
    func itemID(itemID: Int) {
        self.itemID.text = String(itemID)
    }
    
    func itemsNumber(itemsNumber: Int) {
        self.itemsNumber.text = String(itemsNumber)
    }
    
    func processDate(processDate: String) {
        self.processDate.text = String(processDate)
    }
    
    func processValue(processValue: String) {
        self.processValue.text = String(processValue)
    }

}
