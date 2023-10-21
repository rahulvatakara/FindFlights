//
//  Airport.swift
//  FindFlights 
//
//  Created by Rahul C K on 16/10/23.
//

import Foundation

struct AirportsAPIResponse: Codable {
    let stations: [AirPort]
}

struct AirPort: Codable {
    let code, name: String
    let alternateName: String?
    let alias: [String]
    let countryCode, countryName: String
    let countryAlias: String?
    let countryGroupCode: String
    let timeZoneCode, latitude, longitude: String
    let mobileBoardingPass: Bool
    let tripCardImageURL: String?
    let airportShopping: Bool?
}

extension AirPort: CustomStringConvertible {
    var description: String {
        name
    }
}
