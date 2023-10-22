//
//  SelectAirportViewModelTest.swift
//  FindFlightsTests
//
//  Created by Rahul C K on 22/10/23.
//

import XCTest
@testable import FindFlights

final class SelectAirportViewModelTest: XCTestCase {
    var sut: SelectAirportViewModel!
    var mockAPIHandler: MockSearchAPIHandler!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockAPIHandler = MockSearchAPIHandler()
        sut = SelectAirportViewModel(searchAPIHandler: mockAPIHandler)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        mockAPIHandler = nil
        sut = nil
    }

    func testFilteredAccountsTwo() {
        let mockTypeString = "Aa"
        sut.airports = MockApiResponseProvider.airportList
        sut.searchText = mockTypeString

        let airports = sut.filteredAccounts

        let firstAirport = airports[0]
        XCTAssertEqual(airports.count, 2)
        XCTAssertTrue(firstAirport.name.hasPrefix(mockTypeString))
    }

    func testFilteredAccountsOne() {
        let mockTypeString = "Aalborg"
        sut.airports = MockApiResponseProvider.airportList
        sut.searchText = mockTypeString

        let airports = sut.filteredAccounts

        let firstAirport = airports[0]
        XCTAssertEqual(airports.count, 1)
        XCTAssertTrue(firstAirport.name.hasPrefix(mockTypeString))
    }
  
}
