import UIKit

// MARK: - Storage Protocol
protocol StorageView: AnyObject {
    func reloadStorage()
}

// MARK: - Storage Cell Protocol
protocol StorageCellView {
    func setProductName (productName: String)
    func setMinQuantity (min: String)
    func setMaxQuantity (max: String)
    func setAvgQuantity (avg: Int)
}

// MARK: - Storage Presenter
class StoragePresenter {
    
    // Creating a delegate Variable
    private weak var delegate: StorageView?
    
    // Creating object from StockModel
    var cellItems: StockModel?
    
    // Setup Delegate
    init(delegate: StorageView) {
        self.delegate = delegate
    }
    
    // Get Storage Api Func
    func getStorageApi() {
        API.stockCodeNetwork(Url: URLs.stock_Url) { error, success, data in
            if success {
            self.cellItems = data
                self.delegate?.reloadStorage()
            } else {
                self.delegate?.reloadStorage()
            }
        }
    }
    
    // Configure Cell
    func configureCell(cell: StorageCellView, for index: Int) {
        guard let Item = cellItems?.data.items[index] else {return}
        cell.setProductName(productName: Item.name)
        cell.setMinQuantity(min: Item.minQuantity)
        cell.setAvgQuantity(avg: Item.quantity)
        cell.setMaxQuantity(max: Item.maxQuantity)
        
    }
    
    // Get Count of Products in Storage
    func getItemsCount() -> Int {
        return cellItems?.data.items.count ?? 0
    }
}


