import AnimatableReload

extension MyProductsVC: MyProductsView {
    
    // MARK: - Setting up Presenter
    func setupPresenter(){
        presenter = MyProductsPresenter(delegate: self)
    }
    
    // MARK: - Reload MyProducts TableView Action
    func reloadMyProducts() {
        self.productTableView.reloadData()
        self.noDataToDisplayMsg(tableview: self.productTableView, tableViewDataArrCount: presenter.getItemsCount())
    }

    // MARK: - Delete Product Method
    func deleteMyProduct(index: IndexPath) {
        self.productTableView.beginUpdates()
        self.productTableView.deleteRows(at: [index], with: .top)
        self.productTableView.endUpdates()
        self.noDataToDisplayMsg(tableview: self.productTableView, tableViewDataArrCount: presenter.getItemsCount())
    }
}
