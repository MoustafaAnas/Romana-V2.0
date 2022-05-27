import UIKit

let errorMsgLbl = UILabel()
let imgErrorPhoto = UIImageView()

extension UIViewController {
   
    func noDataToDisplayMsg(tableview:UITableView, tableViewDataArrCount: Int) {
       
        
        errorMsgLbl.frame = CGRect(x: 50, y: 250, width: self.view.frame.width - 100, height: 200)
        
        if tableViewDataArrCount == 0 {
            tableview.isHidden = true

            errorMsgLbl.text = "Empty"
            errorMsgLbl.textColor = UIColor.lightGray
            errorMsgLbl.textAlignment = .center
            self.view.addSubview(errorMsgLbl)
        } else {
            errorMsgLbl.isHidden = true
            tableview.isHidden = false
        }
    }
    
    func noDataToDisplayMsgWithImage(tableview:UITableView, tableViewDataArrCount: Int, image: String = "icloud.slash") {
        
        imgErrorPhoto.frame = CGRect(x: 50, y: 250, width: self.view.frame.width - 100, height: 200)
        errorMsgLbl.frame = CGRect(x: imgErrorPhoto.frame.minX, y: imgErrorPhoto.frame.maxY + 15, width: imgErrorPhoto.frame.width, height: 30)
        
        if tableViewDataArrCount == 0 {
            tableview.isHidden = true
            imgErrorPhoto.isHidden = false
            errorMsgLbl.isHidden = false
            imgErrorPhoto.image = UIImage(systemName: image)
            imgErrorPhoto.tintColor = UIColor.lightGray
            self.view.addSubview(imgErrorPhoto)
            

            errorMsgLbl.text = "Empty"
            errorMsgLbl.textColor = UIColor.lightGray
            errorMsgLbl.textAlignment = .center
            self.view.addSubview(errorMsgLbl)
        }
        else {
            imgErrorPhoto.isHidden = true
            errorMsgLbl.isHidden = true
            tableview.isHidden = false
        }
    }
}
