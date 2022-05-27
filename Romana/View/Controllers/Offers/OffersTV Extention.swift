import UIKit
extension OffersVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setting up Table View
    func setupTableView() {
        offersTV.delegate = self
        offersTV.dataSource = self
    }
    
    // MARK: - No. of Cells in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getItemsCount()
    }

    // MARK: - Cell Data Content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OffersTVCell

        presenter.configureCell(cell: cell, for: indexPath.row)
        
    //        if item.items[indexPath.row].product.isActive == 1 {
    //            cell.offerActivtionStateLbl.textColor = UIColor.brown
    //        }
    //        else {
    //            cell.offerActivtionStateLbl.textColor = UIColor.darkGray
    //        }
        
        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 2, y: 2, width: bounds.width-4, height: bounds.height-10), cornerRadius: 5).cgPath
        cell.layer.mask = maskLayer
        
        return cell
    }
        
    // MARK: - Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    // MARK: - Swipe Action Button Configuration
    //    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    //        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, complitionHandler in
    //            self.offerArr.remove(at: indexPath.row)
    //            tableView.beginUpdates()
    //            tableView.deleteRows(at: [indexPath], with: .automatic)
    //            tableView.endUpdates()
    //            self.noDataToDisplayMsg(tableview: self.offersTV, tableViewDataArrCount: self.offerArr.count)
    //
    //            complitionHandler(true)
    //        }
    //
    //        let editAction = UIContextualAction(style: .normal, title: "Edit") { (_, _, _) in
    //
    //            self.editBtnActionSheet(index: indexPath.row)
    //
    //        }
    //
    //        deleteAction.image = UIImage(systemName: "trash.fill")
    //        editAction.image = UIImage(systemName: "pencil")
    //
    //        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    //    }
    //
    //    func editBtnActionSheet(index: Int) {
    //        let alert = UIAlertController(title: "Do you want to enable/disable the offer?", message: "", preferredStyle: .actionSheet)
    //        alert.addAction(UIAlertAction(title: "Enable", style: .default, handler: { ـ in
    //            self.offerArr[index].offerActivtionState = "Enabled"
    //            self.offersTV.reloadData()
    //        }))
    //        alert.addAction(UIAlertAction(title: "Disable", style: .default, handler: { ـ in
    //            self.offerArr[index].offerActivtionState = "Disabled"
    //            self.offersTV.reloadData()
    //        }))
    //        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    //        present(alert, animated: true, completion: nil)
    //    }

    //____________________________________________________________________________________________
}
