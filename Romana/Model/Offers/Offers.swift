
// MARK: - Offers Model
struct OffersModel: Codable {
    let status: Bool
    let data: OffersDataClass
}

// MARK: - DataClass
struct OffersDataClass: Codable {
    let items: [OffersDataItem]
}

// MARK: - DataItem
struct OffersDataItem: Codable {
    let id: Int?
    let itemsSumTotal: String?
    let createdAt: String?
    let items: [OffersItem]?

    enum CodingKeys: String, CodingKey {
        case id
        case itemsSumTotal = "items_sum_total"
        case createdAt = "created_at"
        case items
    }
}

// MARK: - ItemItem
struct OffersItem: Codable {
    let id: Int?
    let product: Product?
    let price: String?
    let unit: String?
    let quantity: Int?
    let total: String?
}

