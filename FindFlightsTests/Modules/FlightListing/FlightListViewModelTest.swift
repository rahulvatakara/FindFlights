//
//  FlightListViewModelTests.swift
//  FindFlightsTests
//
//  Created by Rahul C K on 20/10/23.
//

import XCTest
@testable import FindFlights


final class FlightListViewModelTests: XCTestCase {
    
    var sut: FlightListViewModel!
    var mockSearchAPI : MockSearchAPIHandler!
    var mockRecentSearchHandler : MockRecentSearchStorageHandler!
    var expectation: XCTestExpectation!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        expectation = XCTestExpectation(description: "Expectation for search API")
        mockSearchAPI = MockSearchAPIHandler(expectation: expectation)
        mockRecentSearchHandler = MockRecentSearchStorageHandler()
        let param = SearchFlightParameters(
            origin: "DUB",
            destination: "AMS",
            dateOut: "2023-10-21",
            dateIn: nil,
            flexDaysBeforeOut: 3,
            flexDaysOut: 3,
            flexDaysBeforeIn: 3,
            flexDaysIn: 3,
            adultCount: 1,
            teenCount: 0,
            childCount: 0,
            roundtrip: false,
            termsAgreed: "AGREED",
            discount: 0
        )
        sut = FlightListViewModel(searchAPIHandler: mockSearchAPI,
                                  recentSearchHandler: mockRecentSearchHandler,
                                  searchFlightParameters: param)
    }


    override func tearDownWithError() throws {
        try super.tearDownWithError()
        mockSearchAPI = nil
        mockRecentSearchHandler = nil
        sut = nil
    }

    func testFetchFlights()  {
        sut.fetchFlights()
        
        wait(for: [self.expectation], timeout: 3)
    
        XCTAssertTrue(mockSearchAPI.fetchFlightsCalled)
    }
    
    func testFlightTimeFromDateString() {
        let mockDateString = "2023-10-26T10:55:00.000"
    
        let result = sut.flightTimeFromDateString(mockDateString)
        
        XCTAssertEqual(result, "10:55")
    }

    func testFlightTimeFromDateStringEmpty() {
        let mockDateString = "2023-10-26T10:000"
    
        let result = sut.flightTimeFromDateString(mockDateString)
        
        XCTAssertEqual(result, "")
    }

    func testSaveSearchData() {
        mockRecentSearchHandler.searchExistsValue = false

        sut.saveSearchData()

        XCTAssertTrue(mockRecentSearchHandler.addRecentSearchCalled)
    }
}
