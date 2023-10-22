//
//  RecentSearchViewModelTest.swift
//  FindFlightsTests
//
//  Created by Rahul C K on 21/10/23.
//

import XCTest
@testable import FindFlights

final class RecentSearchViewModelTest: XCTestCase {

    var sut: RecentSearchViewModel!
    var mockRecentSearchHandler : MockRecentSearchStorageHandler!


    override func setUpWithError() throws {
        try super.setUpWithError()
        mockRecentSearchHandler = MockRecentSearchStorageHandler()
        sut = RecentSearchViewModel(recentSearchStorageHandler: mockRecentSearchHandler)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        mockRecentSearchHandler = nil
        sut = nil
    }

    func testFetchRecentSearchs() {
        sut.fetchRecentSearchs()

        XCTAssertTrue(mockRecentSearchHandler.fetchAllRecentsSearchesCalled)
    }

    func testDeleteRecentSearch() {
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
    
        sut.deleteRecentSearch(param)
    
        XCTAssertTrue(mockRecentSearchHandler.deleteRecentsSearchCalled)
    }
}
