//
//  MockSearchAPIHandler.swift
//  FindFlightsTests
//
//  Created by Rahul C K on 20/10/23.
//

import Foundation
import XCTest
@testable import FindFlights
import Combine


class MockSearchAPIHandler: SearchAPIHandling {

    public var fetchAirportListCalled: Bool = false
    public var fetchFlightsCalled: Bool = false
    private var expectation: XCTestExpectation?

    init(expectation: XCTestExpectation? = nil) {
        self.expectation = expectation
    }

    func fetchAirportList() -> Future<FindFlights.AirportsAPIResponse, Error> {
        fetchAirportListCalled = true
        return Future<AirportsAPIResponse, Error> { promise in
            promise(.success(MockApiResponseProvider.airportAPIResponse()))
            self.expectation?.fulfill()
        }
    }

    func fetchFlights(searchFlightParam: FindFlights.SearchFlightParameters) -> Future<FlightSearchResponse, Error> {
        fetchFlightsCalled = true
        return Future<FlightSearchResponse, Error> { promise in
            promise(.success(MockApiResponseProvider.searchAPIResponse()))
            self.expectation?.fulfill()
        }
    }
}
