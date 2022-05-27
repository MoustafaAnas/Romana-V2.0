import Foundation

// MARK: - Welcome
struct UsersModel: Codable {
    let status: Bool
    let data: [UsersDataModel]
}

// MARK: - Users
struct UsersDataModel: Codable {
    let id: Int?
    let name: String?
    let companyName, commercialNumber: String?
    let phone, email: String?
    let commercialImage, licenceImage, image: String?
    let address, lat, lng, landline: String?
    let companies: [Company]?
    let token: String?
    let permissions: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case companyName = "company_name"
        case commercialNumber = "commercial_number"
        case phone, email
        case commercialImage = "commercial_image"
        case licenceImage = "licence_image"
        case image, address, lat, lng, landline, companies, token
        case permissions
    }
}
