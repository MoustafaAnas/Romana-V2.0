import UIKit

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // MARK: - No. of Rows in Sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return sectionDataArr.count
        } else {
            return policyTVDataArr.count
        }
    }
    
    // MARK: - Sections Headers
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            
            return UIView()
        } else {
            let headerView = tableView.dequeueReusableCell(withIdentifier: "cell3") as! HomeTableViewHeader
            headerView.showAllBtn.addTarget(self, action: #selector(goToPoliciesVC), for: .touchUpInside)
           return headerView
        }
    }

    // MARK: - Headers Height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 20
        }
    
    // MARK: - Data in cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CollViewCell
        let data = sectionDataArr[indexPath.row]
        cell.setupCell(title: data.sectionName, cellData: data.collectionViewData)
            
        cell.showAllBtn.tag = indexPath.row
        cell.showAllBtn.addTarget(self, action:#selector(goToBillsVC), for: .touchUpInside)
            
        return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! homeTableViewCell
            cell.orderPrice.text = policyTVDataArr[indexPath.row].orderPrice
            cell.oderDate.text = policyTVDataArr[indexPath.row].oderDate
            cell.orderID.text = policyTVDataArr[indexPath.row].orderID
            return cell
        }
    }
    
    // MARK: - Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }
        else {
            return 120
        }
    }
    
    // MARK: - What Happenes After Clicking on Cells
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
       print("section 0")
           
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PolicyDetalisVC") as! PolicyDetalisVC
            navigationController?.pushViewController(vc, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
