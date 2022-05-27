
extension StorageVC: StorageView {
    
    // MARK: - Setting up Presenter
    func setupPresenter() {
        presenter = StoragePresenter(delegate: self)
    }
    
    // MARK: - Reload Storage tableView Action
    func reloadStorage() {
        self.storageTV.reloadData()
        self.noDataToDisplayMsg(tableview: self.storageTV, tableViewDataArrCount: presenter.getItemsCount())
    }
}
