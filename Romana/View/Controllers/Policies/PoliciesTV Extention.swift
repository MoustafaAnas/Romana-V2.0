import UIKit

extension PoliciesVC: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Setup TableView
    func setupTableView() {
        policiesTableView.delegate = self
        policiesTableView.dataSource = self
    }
    
    // MARK: - No. of Rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return policyCellData.count
    }
    
    // MARK: - Data in Celss
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! homeTableViewCell
        cell.orderPrice.text = policyCellData[indexPath.row].orderPrice
        cell.oderDate.text = policyCellData[indexPath.row].oderDate
        cell.orderID.text = policyCellData[indexPath.row].orderID
        return cell
    }
    
    // MARK: - Cells Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    // MARK: - Action After Clicking on the Cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PolicyDetalisVC") as! PolicyDetalisVC
            navigationController?.pushViewController(vc, animated: true)
        
            tableView.deselectRow(at: indexPath, animated: true)
    }
}
