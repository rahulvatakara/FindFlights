//
//  PassengerCountPickerViewModelTest.swift
//  FindFlightsTests
//
//  Created by Rahul C K on 20/10/23.
//

import XCTest
@testable import FindFlights

final class PassengerCountPickerViewModelTest: XCTestCase {

    func testPassengersDetails()  {
        let sut = PassengerCountPickerViewModel(numberOfAdults: 2,
                                                numberOfTeens: 1,
                                                numberOfInfants: 0,
                                                numberOfChildren: 3)
        let passengerDetails = sut.passengersDetails()
        
        XCTAssertEqual(passengerDetails.numberOfAdults, 2)
        XCTAssertEqual(passengerDetails.numberOfTeens, 1)
        XCTAssertEqual(passengerDetails.numberOfInfants, 0)
        XCTAssertEqual(passengerDetails.numberOfChildren, 3)
    }
}
