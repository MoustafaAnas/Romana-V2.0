import UIKit
import FTIndicator

extension MoreVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setting up TableView
    func setupTableView(){
        moreTabeView.delegate = self
        moreTabeView.dataSource = self
        
        moreArr.append(MoreData(iconCell: UIImage(systemName: "person.fill")!, titleCell: "Profile"))
        moreArr.append(MoreData(iconCell: UIImage(systemName: "cube.box.fill")!, titleCell: "My Products"))
        moreArr.append(MoreData(iconCell: UIImage(systemName: "aqi.medium")!, titleCell: "Offers"))
        moreArr.append(MoreData(iconCell: UIImage(systemName: "rectangle.3.group.fill")!, titleCell: "Storage"))
        moreArr.append(MoreData(iconCell: UIImage(systemName: "message.fill")!, titleCell: "Chat"))
        moreArr.append(MoreData(iconCell: UIImage(systemName: "person.3.fill")!, titleCell: "Employee"))
        moreArr.append(MoreData(iconCell: UIImage(systemName: "doc.on.doc.fill")!, titleCell: "Reports"))
        moreArr.append(MoreData(iconCell: UIImage(systemName: "doc.fill")!, titleCell: "Polices"))
        moreArr.append(MoreData(iconCell: UIImage(systemName: "rectangle.trailinghalf.inset.filled.arrow.trailing")!, titleCell: "Logout"))
    }
    
    // MARK: - No. of Cells in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moreArr.count
    }
    
    // MARK: - Cell Data Content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoreTVCell
        cell.moreImgCell.image = moreArr[indexPath.row].iconCell
        cell.moreTitleLbl.text = moreArr[indexPath.row].titleCell
        
        return cell
    }

    // MARK: - Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // MARK: - Action After Selecting Cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        switch moreArr[indexPath.row].titleCell {
        case "Profile":
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            navigationController?.pushViewController(vc, animated: true)
        case "My Products":
            let vc = storyboard?.instantiateViewController(withIdentifier: "MyProductsVC") as! MyProductsVC
            navigationController?.pushViewController(vc, animated: true)
        case "Offers":
            let vc = storyboard?.instantiateViewController(withIdentifier: "OffersVC") as! OffersVC
            navigationController?.pushViewController(vc, animated: true)
        case "Storage":
            let vc = storyboard?.instantiateViewController(withIdentifier: "StorageVC") as! StorageVC
            navigationController?.pushViewController(vc, animated: true)
        case "Chat":
            let vc = storyboard?.instantiateViewController(withIdentifier: "MessagesVC") as! MessagesVC
            navigationController?.pushViewController(vc, animated: true)
        case "Employee":
            let vc = storyboard?.instantiateViewController(withIdentifier: "EmployeesVC") as! EmployeesVC
            navigationController?.pushViewController(vc, animated: true)
        case "Reports":
            let vc = storyboard?.instantiateViewController(withIdentifier: "ReportsVC") as! ReportsVC
            navigationController?.pushViewController(vc, animated: true)
        case "Polices":
            performSegue(withIdentifier: "goToPolicy", sender: self)
        case "Logout":
            FTIndicator.showProgress(withMessage: "", userInteractionEnable: false)
            logout()
            FTIndicator.showSuccess(withMessage: "Success Logout")
            
        default:
            print("def")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
