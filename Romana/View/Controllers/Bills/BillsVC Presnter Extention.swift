import AnimatableReload

extension BillsVC: BillsView {
    
    // MARK: - Setting up Presenter
    func setupPresenter() {
        presenter = BillsPresenter(delegate: self)
    }
    
    // MARK: - Purchase Animation Method
    func purchaseAnimation() {
        self.billsTableView.reloadData()
        AnimatableReload.reload(tableView: self.billsTableView, animationDirection: "left")
        self.noDataToDisplayMsg(tableview: self.billsTableView, tableViewDataArrCount: presenter.getItemsCount())
    }
    
    // MARK: - Return Purchase Animation Method
    func returnPurchaseAnimation() {
        self.billsTableView.reloadData()
        AnimatableReload.reload(tableView: self.billsTableView, animationDirection: "right")
        self.noDataToDisplayMsg(tableview: self.billsTableView, tableViewDataArrCount: presenter.getItemsCount())
    }
    
    
}
