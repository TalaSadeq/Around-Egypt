import Foundation

// MARK: - HTTPS34MlCOMAPIV2Experiences
struct Response: Codable {
    var meta: Meta?
    var data: [Datum?]
    var pagination: Pagination?
}

// MARK: - Datum
struct Datum: Codable {
    var id, title: String?
    var cover_photo: String?
    var description: String?
    var viewsNo, likesNo, recommended, hasVideo: Int?
    var tags: [City?]
    var city: City?
    var tourHTML: String?
    var famousFigure: String?
    var period, era: Era?
    var founded, detailedDescription, address: String?
    var gmapLocation: GmapLocation?
    var openingHours: OpeningHoursClass?
    var translatedOpeningHours: TranslatedOpeningHours?
    var startingPrice: Int?
    var ticketPrices: TicketPrice?
    var experienceTips: String?// Change this to an appropriate Codable type
    var isLiked: Bool? // Change this to a Bool type
    var reviews: [String?] // Change this to an appropriate Codable type
    var rating, reviewsNo: Int?
    var audioURL: String?
    var hasAudio: Bool?
}

// MARK: - City
struct City: Codable {
    var id: Int?
    var name: String?
    var disable: Bool? // Change this to a Bool type
    var topPick: Int?
}

// MARK: - Era
struct Era: Codable {
    var id, value, createdAt, updatedAt: String?
}

// MARK: - GmapLocation
struct GmapLocation: Codable {
    var type: TypeEnum?
    var coordinates: [Double]
}

enum TypeEnum: String, Codable {
    case point
}

// MARK: - OpeningHoursClass
struct OpeningHoursClass: Codable {
    var sunday, monday, tuesday, wednesday: [String?]
    var thursday, friday, saturday: [String?]
}

// MARK: - TicketPrice
struct TicketPrice: Codable {
    var type: String?
    var price: Int?
}

// MARK: - TranslatedOpeningHours
struct TranslatedOpeningHours: Codable {
    var sunday, monday, tuesday, wednesday: FridayClass?
    var thursday, friday, saturday: FridayClass?
}

// MARK: - FridayClass
struct FridayClass: Codable {
    var day: DayEnum?
    var time: String?
}

enum DayEnum: String, Codable {
    case friday
    case monday
    case saturday
    case sunday
    case thursday
    case tuesday
    case wednesday
}

// MARK: - Meta
struct Meta: Codable {
    var code: Int?
    var errors: [String?] // Change this tos an appropriate Codable type
}

// MARK: - Pagination
struct Pagination: Codable {
    // Add appropriate properties here if needed
    var page : String?
}
