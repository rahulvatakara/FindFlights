//
//  PassengerCountPickerViewModelTest.swift
//  FindFlightsTests
//
//  Created by Rahul C K on 20/10/23.
//

import XCTest
@testable import FindFlights

final class PassengerCountPickerViewModelTest: XCTestCase {
    var sut: PassengerCountPickerViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = PassengerCountPickerViewModel(numberOfAdults: 2,
                                                numberOfTeens: 1,
                                                numberOfInfants: 0,
                                                numberOfChildren: 3)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testPassengersDetails()  {
        let passengerDetails = sut.passengersDetails()

        XCTAssertEqual(passengerDetails.numberOfAdults, 2)
        XCTAssertEqual(passengerDetails.numberOfTeens, 1)
        XCTAssertEqual(passengerDetails.numberOfInfants, 0)
        XCTAssertEqual(passengerDetails.numberOfChildren, 3)
    }

    func testMinNumberOfAdults()  {
        XCTAssertEqual(sut.minNumberOfAdults, 1)
    }

    func testMinNumberOfSeats()  {
        XCTAssertEqual(sut.minNumberOfSeats, 0)

    }

    func testMaxNumberOfSeats()  {
        XCTAssertEqual(sut.maxNumberOfSeats, 6)
    }
}
