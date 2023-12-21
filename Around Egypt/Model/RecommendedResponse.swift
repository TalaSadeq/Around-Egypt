//
//  RecommendedResponse.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/20/23.
//

import Foundation
struct RecommendedResponse : Codable{
    var meta: Meta
    var data: [Datum]
    var pagination: Pagination
}

// MARK: - Datum
struct DatumRecommended  : Codable{
    var id, title: String
    var coverPhoto: String
    var description: String
    var viewsNo, likesNo, recommended, hasVideo: Int
    var tags: [City]
    var city: City
    var tourHTML: String
    var famousFigure: String
    var period, era: Era?
    var founded, detailedDescription, address: String
    var gmapLocation: GmapLocation
    var openingHours: OpeningHoursUnionRecommended
    var translatedOpeningHours: TranslatedOpeningHours
    var startingPrice: Int?
    var ticketPrices: [TicketPrice]
    var experienceTips: [String?]
    var isLiked: String
    var reviews: [String?]
    var rating, reviewsNo: Int
    var audioURL: String
    var hasAudio: Bool
}

// MARK: - City
struct CityRecommended  : Codable {
    var id: Int
    var name: String
    var disable: Int?
    var topPick: Int
}

// MARK: - Era
struct EraRecommended  : Codable {
    var id, value, createdAt, updatedAt: String
}

// MARK: - GmapLocation
struct GmapLocationRecommended  : Codable {
    var type: String
    var coordinates: [Double]
}

enum OpeningHoursUnionRecommended  : Codable {
    case anythingArray([String?])
    case openingHoursClass(OpeningHoursClass)
}

// MARK: - OpeningHoursClass
struct OpeningHoursClassRecommended  : Codable {
    var sunday, monday, tuesday, wednesday: [String]
    var thursday, friday, saturday: [String]
}

enum TimeStringRecommended  : Codable {
    case the07001600
    case the09000400
    case the09001200
    case the09001600
    case the09001700
    case the09001900
}

// MARK: - TicketPrice
struct TicketPriceRecommended  : Codable {
    var type: String
    var price: Int
}

// MARK: - TranslatedOpeningHours
struct TranslatedOpeningHoursRecommended  : Codable {
    var sunday, monday, tuesday, wednesday: String?
    var thursday, friday, saturday: String?
}

// MARK: - Day
struct DayRecommended  : Codable {
    var day: String
    var time: TimeStringRecommended
}

// MARK: - Meta
struct MetaRecommended  : Codable {
    var code: Int
    var errors: [String?]
}

// MARK: - Pagination
struct PaginationRecommended  : Codable {
}
