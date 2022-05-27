import UIKit
import Kingfisher

class MyProductTVCell: UITableViewCell, MyProductsCellView {

    @IBOutlet weak var productImgView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productUnit: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Setting up Cell
    func setProductName(productName: String) {
        self.productName.text = productName
    }
    
    func setProductPrice(productPrice: String) {
        self.productPrice.text = productPrice
    }
    
    func setProductUnit(unit: String) {
        self.productUnit.text = unit
    }
    
    func setProductImg(img: String) {
        if img != "" {
        productImgView.kf.indicatorType = .activity
        guard let url = URL(string: img ) else {return}
        productImgView.kf.setImage(with: url, placeholder: UIImage(systemName: "macpro.gen2.fill"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        else {
            productImgView.image = UIImage(systemName: "macpro.gen2.fill")
        }
    }
  

}
