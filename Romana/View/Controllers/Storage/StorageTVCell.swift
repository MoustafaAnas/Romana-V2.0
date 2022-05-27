import UIKit

class StorageTVCell: UITableViewCell, StorageCellView {

    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var minValueLbl: UILabel!
    @IBOutlet weak var storageSlider: UISlider!
    @IBOutlet weak var avgValueLbl: UILabel!
    @IBOutlet weak var maxValueLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        storageSlider.setThumbImage(UIImage(), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Setting up Cell
    func setProductName(productName: String) {
        productNameLbl.text = productName
    }
    
    func setMinQuantity(min: String) {
        minValueLbl.text = min
        storageSlider.minimumValue = Float(min) ?? 0
    }
    
    func setMaxQuantity(max: String) {
        maxValueLbl.text = max
        storageSlider.maximumValue = Float(max) ?? 0
    }
    
    func setAvgQuantity(avg: Int) {
        avgValueLbl.text = String(avg)
        storageSlider.value = Float(avg)
    }

}
