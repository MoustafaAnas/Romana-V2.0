import UIKit

// MARK: - Offers Protocol
protocol OffersView: AnyObject {
    func reloadOffers()
}

// MARK: - Offers Cell Protocol
protocol OffersCellView {
    func setOfferID (ID: Int)
    func setOfferTotalPrice (price: String)
    func setOfferDate (date: String)
}

// MARK: - Offers Presenter
class OffersPresenter {
    
    // Creating a Delegate Varible
    private weak var delegate: OffersView?
    
    // Creating object from OffersModel
    var cellItems: OffersModel?
    
    // Setup Delegate
    init(delegate: OffersView) {
        self.delegate = delegate
    }
    
    // Get Offers Api
    func getOffersApi() {
        API.offersCodeNetwork(Url: URLs.offers_Url) {error, success, data in
            if success {
                self.cellItems = data
                self.delegate?.reloadOffers()
            }
        }
    }
    
    // Configur Cell
    func configureCell(cell: OffersCellView, for index: Int) {
        guard let Item = cellItems?.data.items[index] else {return}
        cell.setOfferDate(date: Item.createdAt ?? "")
        cell.setOfferID(ID: Item.id ?? 0 )
        cell.setOfferTotalPrice(price: Item.itemsSumTotal ?? "")
    }
    
    // Get Number of Offers
    func getItemsCount() -> Int {
        return cellItems?.data.items.count ?? 0
    }
}


