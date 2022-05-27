import UIKit

extension BillsVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setting up Table View
    func setupTableView() {
        billsTableView.delegate = self
        billsTableView.dataSource = self
    }
    
    // MARK: - No. of Cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getItemsCount()
    }
    
    // MARK: - Cells Data Content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BillsTVCell
               
            if processTypeSC.selectedSegmentIndex == 0 {
                    cell.processImage.image = UIImage(systemName: "cart.fill")
                    cell.processImage.tintColor = UIColor.brown
                    cell.processValue.textColor = UIColor.brown
                }
                else {
                    cell.processImage.image = UIImage(systemName: "cube.box.fill")
                    cell.processImage.tintColor = UIColor.orange
                    cell.processValue.textColor = UIColor.orange
                }
        
        presenter.configureCell(cell: cell, for: indexPath.row)

        return cell
    }
    
    // MARK: - Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 85
    }
 
}
