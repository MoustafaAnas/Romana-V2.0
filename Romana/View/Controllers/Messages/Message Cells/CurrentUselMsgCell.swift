import UIKit

class CurrentUselMsgCell: UITableViewCell, MessageCellView {

    @IBOutlet weak var msgLbl: UILabel!
    @IBOutlet weak var msgTime: UILabel!
    
  
  override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Configure Cell Data
    func setMessage(msg: String) {
        msgLbl.text = msg
    }
    
    func setProfileImg(img: String) {
    }

}
