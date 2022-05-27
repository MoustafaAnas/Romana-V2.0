// MARK: - Storage Model
struct StockModel: Codable {
    let status: Bool
    let data: ModelDataClass
}

// MARK: - DataClass
struct ModelDataClass: Codable {
    let items: [StockItem]
}

// MARK: - Item
struct StockItem: Codable {
    let id: Int
    let name, barcode: String
    let barCodes: [String]
    let unit: String
    let price, image, notes: String?
    let isActive: Int
    let minQuantity, maxQuantity: String
    let quantity: Int

    enum CodingKeys: String, CodingKey {
        case id, name, barcode
        case barCodes = "bar_codes"
        case unit, price, image, notes
        case isActive = "is_active"
        case minQuantity = "min_quantity"
        case maxQuantity = "max_quantity"
        case quantity
    }
}
