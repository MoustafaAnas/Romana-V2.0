import UIKit

extension MyProductsVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setting up Table view
    func setupTableView() {
        productTableView.delegate = self
        productTableView.dataSource = self
    }
    
    // MARK: - No. of Cells in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getItemsCount()
    }
    
    // MARK: - cell Data Content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyProductTVCell
        
        presenter.configureCell(cell: cell, for: indexPath.row)
        
        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 2, y: 2, width: bounds.width-4, height: bounds.height-10), cornerRadius: 5).cgPath
        cell.layer.mask = maskLayer
        
        return cell
    }
    
    // MARK: - What Cell Will Display When Reaching to last IndexPath
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //        guard let item = cellItems else { return }
        //        if indexPath.row == item.data.items.count - 3 {
        //            if let nextURL = item.data.paginate?.nextPageURL, !nextURL.isEmpty{
        //                self.getMyProducts(Url: nextURL)
        //            }
        //        }
    }
    
    // MARK: - Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    // MARK: - Swipe Action Buttons Configuration
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if productsIsFiltered {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, complitionHandler in
            
            self.presenter.deleteMyProductApi(index: indexPath)
            complitionHandler(true)
        }

        let editAction = UIContextualAction(style: .normal, title: "Edit") { (_, _, _) in

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddProductVC") as! AddProductVC
            self.navigationController?.pushViewController(vc, animated: true)

            self.productTableView.reloadData()
        }

        deleteAction.image = UIImage(systemName: "trash.fill")
        editAction.image = UIImage(systemName: "pencil")

        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        } else {
            return UISwipeActionsConfiguration()
        }
    }
    
    
    
}
