//
//  FlightSearchResponseTest.swift
//  FindFlightsTests
//
//  Created by Rahul C K on 20/10/23.
//

import XCTest
import FindFlights

final class FlightSearchResponseTest: XCTestCase {
    
    func testExtractFlightDetails() {
        let flightSearchResponse = MockApiResponseProvider.searchAPIResponse()

        let flightList = flightSearchResponse.extractFlightDetails()

        XCTAssertEqual(flightList.count, 4)
    }

}
