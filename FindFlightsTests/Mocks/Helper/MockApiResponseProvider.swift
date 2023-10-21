//
//  MockApiResponseProvider.swift
//  FindFlightsTests
//
//  Created by Rahul C K on 20/10/23.
//

import Foundation
@testable import FindFlights

class MockApiResponseProvider {
    
    public static func airportAPIResponse() -> AirportsAPIResponse {
        let jsonData = getData(name: "airportlist")
        let data = try! JSONDecoder().decode(AirportsAPIResponse.self, from: jsonData)
        return data
    }

    public static func searchAPIResponse() -> FlightSearchResponse {
        let jsonData = getData(name: "searchResult")
        let data = try! JSONDecoder().decode(FlightSearchResponse.self, from: jsonData)
        return data
    }

    public static var airportList: [AirPort] {
        return airportAPIResponse().stations
    }

    public static func getData(name: String, withExtension: String = "json") -> Data {
        let bundle = Bundle(for: MockApiResponseProvider.self)
        let fileUrl = bundle.url(forResource: name, withExtension: withExtension)
        let data = try! Data(contentsOf: fileUrl!)
        return data
    }
}
