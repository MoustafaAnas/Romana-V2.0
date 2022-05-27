import UIKit

extension BankAccountsVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setting up Tableview
    func setupTableView(){
        BankAccountsTV.allowsSelection = false
        
        BankAccountsTV.delegate = self
        BankAccountsTV.dataSource = self
    }
    
    // MARK: - No. Cells in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getItemsCount()
    }
    
    // MARK: - Cell Data Content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BankAccountsTVCell
       
        presenter.configureCell(cell: cell, for: indexPath.row)
        
        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 2, y: 2, width: bounds.width-4, height: bounds.height-10), cornerRadius: 5).cgPath
        cell.layer.mask = maskLayer
        
        return cell
    }
    
    // MARK: - Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

    // MARK: - Swipe Action Buttons Configuration
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [self] action, view, complitionHandler in
    
            presenter.deleteBankAccountsApi(index: indexPath)
            complitionHandler(true)
        }

        let editAction = UIContextualAction(style: .normal, title: "Edit") { (_, _, _) in
            self.presenter.editBankAccount(index: indexPath.row)
        }

        deleteAction.image = UIImage(systemName: "trash.fill")
        editAction.image = UIImage(systemName: "pencil")

        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
    
}
