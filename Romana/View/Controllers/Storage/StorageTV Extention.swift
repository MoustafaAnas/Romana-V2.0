import UIKit

extension StorageVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setting up Table View
    func setupTableView(){
        storageTV.delegate = self
        storageTV.dataSource = self
    }
    
    // MARK: - No. of Cells in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getItemsCount()
    }
    
    // MARK: - Cell Data Content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StorageTVCell

        presenter.configureCell(cell: cell, for: indexPath.row)
        
        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 2, y: 2, width: bounds.width-4, height: bounds.height-10), cornerRadius: 5).cgPath
        cell.layer.mask = maskLayer
        
        return cell
    }
        
    // MARK: - Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
