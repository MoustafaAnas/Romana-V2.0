import UIKit

// MARK: - MyProducts Protocol
protocol MyProductsView: AnyObject {
    func reloadMyProducts()
    func deleteMyProduct(index: IndexPath)
}

// MARK: - MyProducts Cell Protocol
protocol MyProductsCellView {
    func setProductName (productName: String)
    func setProductPrice (productPrice: String)
    func setProductUnit (unit: String)
    func setProductImg (img: String)
}

// MARK: - MyProducts Presenter
class MyProductsPresenter {
    
    // Creating a Delegate Variable
    private weak var delegate: MyProductsView?
    
    // Creating object from ProductsModel
    var cellItems: ProductsModel?
    
    // Setup Delegate
    init(delegate: MyProductsView) {
        self.delegate = delegate
    }
    
    // Get Products Api Func
    func getMyProductsApi(Url: String) {
        API.productsCodeNetwork(Url: Url) { error, success, data  in
            if success {
            self.cellItems = data
                self.delegate?.reloadMyProducts()
            self.cellItems?.data.paginate = data.data.paginate
            }
        }
    }
    
    // Delete a Product Api Func
    func deleteMyProductApi(index: IndexPath) {
        API.deleteProductCodeNetwork(id: (self.cellItems?.data.items[index.row].id)!) { error, success in
            if success {
                self.cellItems?.data.items.remove(at: index.row)
                self.delegate?.deleteMyProduct(index: index)
                
            } else {
                self.delegate?.reloadMyProducts()
            }
        }
    }
    
    // Configure Cell
    func configureCell(cell: MyProductsCellView, for index: Int) {
        guard let item = cellItems?.data.items[index] else {return}
        
        cell.setProductUnit(unit: item.unit ?? "")
        cell.setProductName(productName: item.name ?? "")
        cell.setProductPrice(productPrice: item.price ?? "")
        cell.setProductImg(img: item.image ?? "")
    }
    
    // Get Number of Products Count
    func getItemsCount() -> Int {
        return cellItems?.data.items.count ?? 0
    }
}


