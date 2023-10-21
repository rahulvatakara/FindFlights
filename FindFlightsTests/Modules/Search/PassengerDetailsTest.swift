//
//  PassengerDetailsTest.swift
//  FindFlightsTests
//
//  Created by Rahul C K on 20/10/23.
//

import XCTest
@testable import FindFlights

final class PassengerDetailsTest: XCTestCase {
    
    func testPassengersDetailsDescriptionOne()  {
        let sut = PassengerDetails(numberOfAdults: 2,
                                   numberOfTeens: 1,
                                   numberOfInfants: 0,
                                   numberOfChildren: 3)

        XCTAssertEqual(sut.description, "2 Adults, 1 Teen, 3 Children")
    }

    func testPassengersDetailsDescriptionTwo()  {
        let sut = PassengerDetails(numberOfAdults: 2,
                                   numberOfTeens: 0,
                                   numberOfInfants: 4,
                                   numberOfChildren: 2)

        XCTAssertEqual(sut.description, "2 Adults, 2 Children, 4 Infants")
    }

    func testPassengersDetailsDescriptionThree()  {
        let sut = PassengerDetails(numberOfAdults: 1,
                                   numberOfTeens: 1,
                                   numberOfInfants: 0,
                                   numberOfChildren: 0)

        XCTAssertEqual(sut.description, "1 Adult, 1 Teen")
    }
}
