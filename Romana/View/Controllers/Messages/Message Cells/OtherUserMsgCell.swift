import UIKit
import Kingfisher

class OtherUserMsgCell: UITableViewCell, MessageCellView {

    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var msgTimeLbl: UILabel!
    @IBOutlet weak var userMsgLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Configure Cell Data
    func setMessage(msg: String) {
        userMsgLbl.text = msg
    }
    
    func setProfileImg(img: String) {
        if img != "" {
        userProfileImg.kf.indicatorType = .activity
        guard let url = URL(string: img ) else {return}
        userProfileImg.kf.setImage(with: url, placeholder: UIImage(systemName: "person.circle.fill"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        else {
            userProfileImg.image = UIImage(systemName: "person.circle.fill")
        }
    }
    

}
