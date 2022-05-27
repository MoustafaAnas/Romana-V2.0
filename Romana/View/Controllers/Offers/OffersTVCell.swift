import UIKit

class OffersTVCell: UITableViewCell, OffersCellView {
    
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var offerImg: UIImageView!
    @IBOutlet weak var offerEndDateLbl: UILabel!
    @IBOutlet weak var offerPriceLbl: UILabel!
    @IBOutlet weak var offerActivtionStateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Setting up Cell
    func setOfferID(ID: Int) {
        productNameLbl.text = String(ID)
    }
    
    func setOfferTotalPrice(price: String) {
        offerPriceLbl.text = price
    }
    
    func setOfferDate(date: String) {
        offerEndDateLbl.text = date
    }
        
//        if item.items?[0].product?.isActive == 1 {
//        offerActivtionStateLbl.text = "Enable"
//        }
//        else {
//            offerActivtionStateLbl.text = "Disable"
//        }
    

}
