//
//  MockRecentSearchStorageHandler.swift
//  FindFlightsTests
//
//  Created by Rahul C K on 21/10/23.
//

import Foundation
@testable import FindFlights

class MockRecentSearchStorageHandler: RecentSearchStorageHandling {

    
    public var fetchAllRecentsSearchesCalled: Bool = false
    public var deleteRecentsSearchCalled: Bool = false
    public var addRecentSearchCalled: Bool = false
    public var searchExistsCalled: Bool = false
    public var searchExistsValue: Bool = false

    


    func fetchAllRecentsSearches() -> [FindFlights.RecentSearchParameters] {
        fetchAllRecentsSearchesCalled = true
        return []
    }

    func deleteRecentsSearch(_ searchParameters: FindFlights.SearchFlightParameters) {
        deleteRecentsSearchCalled = true
    }

    func addRecentSearch(_ recentSearchParameters: FindFlights.SearchFlightParameters) {
        addRecentSearchCalled = true
    }

    func searchExists(for parameters: FindFlights.SearchFlightParameters) -> Bool {
        searchExistsCalled = true
        return searchExistsValue
    }
}
