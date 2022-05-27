import UIKit

class CollViewCell: UITableViewCell {

    @IBOutlet weak var headrAddr: UILabel!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var showAllBtn: UIButton!
    
    
    var cellDataArr = [HomeCollectionViewCellData]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Setting up Cells
    func setupCell (title: String, cellData: [HomeCollectionViewCellData]) {
        self.headrAddr.text = title
        self.cellDataArr = cellData
        
    }
    
}
