import Foundation

// MARK: - Welcome
struct ProductsModel: Codable {
    let status: Bool
    var data: ProductsDataClass
}

// MARK: - DataClass
struct ProductsDataClass: Codable {
    var items: [ProductsItem]
    var paginate: Paginate
}

// MARK: - Item
struct ProductsItem: Codable {
    let id: Int?
    let name, barcode, unit, price: String?
    let image: String?
    let notes: String?
    let isActive: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, barcode, unit, price, image, notes
        case isActive = "is_active"
    }
}



