//
//  SingleExperienceResponse.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/20/23.
//

import Foundation
import UIKit


struct SingleExperience : Codable {
    var meta: Meta
    var data: DataClass
    var pagination: Pagination
}

// MARK: - DataClass
struct DataClass : Codable{
    var id, title: String
    var coverPhoto: String
    var description: String
    var viewsNo, likesNo, recommended, hasVideo: Int
    var tags: [City]
    var city: City
    var tours: [String?]
    var tourURL: String
    var tourHTML: String
    var tourXML: String
    var famousFigure: String
    var period: Era?
    var era: Era
    var founded, detailedDescription, address: String
    var gmapLocation: GmapLocation
    var openingHours: OpeningHoursRes
    var translatedOpeningHours: TranslatedOpeningHours
    var startingPrice: Int
    var ticketPrices: [TicketPrice]
    var experienceTips, reviews: [String?]
    var rating, reviewsNo: Int
    var audioURL: String
    var hasAudio: Bool
}

// MARK: - City
struct CityResp {
    var id: Int
    var name: String
    var disable: NSNull
    var topPick: Int
}

// MARK: - Era
struct EraRes : Codable{
    var id, value, createdAt, updatedAt: String
}

// MARK: - GmapLocation
struct GmapLocationRes : Codable{
    var type: String
    var coordinates: [Double]
}

// MARK: - OpeningHours
struct OpeningHoursRes : Codable {
    var sunday, monday, tuesday, wednesday: [String]
    var thursday, friday, saturday: [String]
}

// MARK: - TicketPrice
struct TicketRes : Codable {
    var type: String
    var price: Int
}

// MARK: - TranslatedOpeningHours
struct TranslatedOpeningHoursRes : Codable{
    var sunday, monday, tuesday, wednesday: [String?]
    var thursday, friday, saturday: [String?]
}

// MARK: - Day
struct DayRes : Codable {
    var day, time: String
}

// MARK: - Meta
struct MetaRes : Codable{
    var code: Int
    var errors: [String?]
}

// MARK: - Pagination
struct PaginationRes : Codable {
}

