// MARK: - Paginate
struct Paginate: Codable {
    let total, count, perPage: Int
    let nextPageURL, prevPageURL: String
    let currentPage, totalPages: Int

    enum CodingKeys: String, CodingKey {
        case total, count
        case perPage = "per_page"
        case nextPageURL = "next_page_url"
        case prevPageURL = "prev_page_url"
        case currentPage = "current_page"
        case totalPages = "total_pages"
    }
}
