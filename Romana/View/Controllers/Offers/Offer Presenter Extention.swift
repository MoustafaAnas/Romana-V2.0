
extension OffersVC: OffersView {
    
    // MARK: - Setting up Presenter
    func setupPresenter() {
        presenter = OffersPresenter(delegate: self)
    }
    
    // MARK: - Reoload Offers TableView Action
    func reloadOffers() {
         self.offersTV.reloadData()
        self.noDataToDisplayMsg(tableview: self.offersTV, tableViewDataArrCount: presenter.getItemsCount())
    }
}
