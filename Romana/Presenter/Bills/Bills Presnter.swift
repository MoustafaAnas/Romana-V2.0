import UIKit

// MARK: - Bill Protocol
protocol BillsView: AnyObject {
    func purchaseAnimation()
    func returnPurchaseAnimation()
}

// MARK: - Bill Cell Protocol
protocol BillsCellView {
    func itemID (itemID: Int)
    func itemsNumber (itemsNumber: Int)
    func processDate (processDate: String)
    func processValue (processValue: String)
}

// MARK: - Bill Presenter
class BillsPresenter {
    
    // Creating a Delegate Variable
    private weak var delegate: BillsView?
    
    // Creating an object From BillsData
    var cellItems: BillsData?
    
    // Setting up Delegate
    init(delegate: BillsView) {
        self.delegate = delegate
    }
    
    // Purchase Api Func
    func purchaseApi() {
        API.purchaseCodeNetwork(Url: URLs.purchase_Url) { [weak self] error, success, data in
            if success {
            guard let self = self else {return}
            self.cellItems = data
            self.delegate?.purchaseAnimation()
            }
        }
    }
    
    // Return Purchase Api Func
    func returnPurchaseApi() {
        API.purchaseCodeNetwork(Url: URLs.returnPurchase_Url) { [weak self] error, success, data in
            if success {
            guard let self = self else {return}
            self.cellItems = data
            self.delegate?.returnPurchaseAnimation()
            }
        }
    }
    
    // Configure Cell
    func configureCell(cell: BillsCellView, for index: Int) {
        guard let Item = cellItems?.data.items[index] else {return}
        cell.itemID(itemID: Item.id)
        cell.itemsNumber(itemsNumber: Item.itemsCount)
        cell.processDate(processDate: Item.createdAt)
        cell.processValue(processValue: Item.total)
    }
    
    // Getting Count of Bills
    func getItemsCount() -> Int {
        return cellItems?.data.items.count ?? 0
    }
}


