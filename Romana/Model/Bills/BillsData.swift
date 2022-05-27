import Foundation

// MARK: - Welcome
struct BillsData: Codable {
    let status: Bool
    let data: BillsDataClass
}

// MARK: - DataClass
struct BillsDataClass: Codable {
    let items: [DataItem]
    let paginate: Paginate
}

// MARK: - DataItem
struct DataItem: Codable {
    let id: Int
    let amount, total, payment, tax: String
    let billNum, createdAt: String
    let itemsCount: Int
    let items: [ItemItem]

    enum CodingKeys: String, CodingKey {
        case id, amount, total, payment, tax
        case billNum = "bill_num"
        case createdAt = "created_at"
        case itemsCount = "items_count"
        case items
    }
}

// MARK: - ItemItem
struct ItemItem: Codable {
    let id: Int
    let product: Product
    let quantity, price: String
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let name, barcode: String
    let barCodes: [String]
    let unit, price, image, notes: String?
    let isActive: Int

    enum CodingKeys: String, CodingKey {
        case id, name, barcode
        case barCodes = "bar_codes"
        case unit, price, image, notes
        case isActive = "is_active"
    }
}






