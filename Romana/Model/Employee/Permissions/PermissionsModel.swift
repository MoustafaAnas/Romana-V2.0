// MARK: - Welcome
struct PermissionsModel: Codable {
    let status: Bool
    let data: PermissionsDataClass
}

// MARK: - DataClass
struct PermissionsDataClass: Codable {
    let statistics: Statistics
    let permissions: [String]
}

// MARK: - Statistics
struct Statistics: Codable {
    let purchases, purchasesReturns, credit: String

    enum CodingKeys: String, CodingKey {
        case purchases
        case purchasesReturns = "purchases_returns"
        case credit
    }
}
