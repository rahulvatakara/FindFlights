//
//  SearchFlightParametersTest.swift
//  FindFlightsTests
//
//  Created by Rahul C K on 21/10/23.
//

import XCTest
@testable import FindFlights
final class SearchFlightParametersTest: XCTestCase {
    
    func testTotalPassengers() {
        let sut = createDefaultSearchParameters()
        
        XCTAssertEqual(sut.totalPassengers, 4, "Total passengers count is incorrect.")
    }
    
    func testStartDateConversion() {
        let sut = createDefaultSearchParameters()
        
        XCTAssertEqual(sut.startDate, "21 Oct", "Start date conversion is incorrect.")
    }
    
    func testReturnDateConversionWithValidDate() {
        let sut = createDefaultSearchParameters()
        
        XCTAssertEqual(sut.returnDate, "25 Oct", "Return date conversion is incorrect.")
    }
    
    func testReturnDateConversionWithNilDate() {
        let sut = createDefaultSearchParameters(dateIn: nil)
        
        XCTAssertEqual(sut.returnDate, "", "Return date conversion should return an empty string for nil dateIn.")
    }

    private func createDefaultSearchParameters(dateIn: String? = "2023-10-25") -> SearchFlightParameters {
        return SearchFlightParameters(origin: "DUB", destination: "AMS", dateOut: "2023-10-21", 
                                      dateIn: dateIn, flexDaysBeforeOut: 3, flexDaysOut: 3, flexDaysBeforeIn: 3,
                                      flexDaysIn: 3, adultCount: 2, teenCount: 1, childCount: 1, roundtrip: true,
                                      termsAgreed: "AGREED", discount: 0)
    }
}
