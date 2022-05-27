// MARK: - Welcome
struct BanksModel: Codable {
    let status: Bool
    let msg: String?
    var data: [BanksDataClass]
}

// MARK: - Datum
struct BanksDataClass: Codable {
    let id: Int?
    let name, ownerName, iban: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case ownerName = "owner_name"
        case iban
    }
}
