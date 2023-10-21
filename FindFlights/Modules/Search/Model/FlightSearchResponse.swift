//
//  FlightSearch.swift
//  FindFlights 
//
//  Created by Rahul C K on 18/10/23.
//

import Foundation

public struct FlightSearchResponse: Codable {
    let termsOfUse: String?
    let currency: String
    let currPrecision: Int?
    let trips: [Trip]
    let serverTimeUTC: String
}

struct Trip: Codable {
    var id: UUID? = UUID()
    let origin: String
    let originName: String
    let destination: String
    let destinationName: String
    let dates: [DateElement]
}

struct DateElement: Codable {
    let dateOut: String
    let flights: [Flight]
}

struct Flight: Codable {
    let faresLeft: Int
    let flightKey: String
    let infantsLeft: Int
    let regularFare: RegularFare
    let operatedBy: String
    let segments: [Segment]
    let flightNumber: String
    let time, timeUTC: [String]
    let duration: String
}

struct RegularFare: Codable {
    let fareKey, fareClass: String
    let fares: [Fare]
}

struct Fare: Codable {
    let type: String
    let amount: Double
    let count: Int
    let hasDiscount: Bool
    let publishedFare: Double
    let discountInPercent: Int
    let hasPromoDiscount: Bool
    let discountAmount: Double
    let hasBogof: Bool
}

struct Segment: Codable {
    let segmentNr: Int
    let origin: String
    let destination: String
    let flightNumber: String
    let time, timeUTC: [String]
    let duration: String
}

