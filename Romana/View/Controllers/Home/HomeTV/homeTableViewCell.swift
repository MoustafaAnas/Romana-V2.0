import UIKit

class homeTableViewCell: UITableViewCell {

    @IBOutlet weak var orderID: UILabel!
    @IBOutlet weak var oderDate: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
