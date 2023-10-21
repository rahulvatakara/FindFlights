//
//  SearchViewModelTest.swift
//  FindFlightsTests
//
//  Created by Rahul C K on 20/10/23.
//

import XCTest
@testable import FindFlights

final class SearchViewModelTest: XCTestCase {
    var sut: SearchViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SearchViewModel()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testIsRoundTripFalse() {
        sut.tripType = 1
        
        XCTAssertFalse(sut.isRoundTrip)
    }
    
    func testIsRoundTripTrue() {
        sut.tripType = 0
        
        XCTAssertTrue(sut.isRoundTrip)
    }
    
    func testDestinationAirportName() {
        let airports: [AirPort] = MockApiResponseProvider.airportList
        sut.destinationAirport = airports.first
        
        XCTAssertEqual(sut.destinationAirportName, "Aalborg")
    }
    
    func testSourceAirportName() {
        let airports: [AirPort] = MockApiResponseProvider.airportList
        sut.sourceAirport = airports.first
        
        XCTAssertEqual(sut.sourceAirportName, "Aalborg")
    }
    
    func testSearchButtonDisabledRoundTripTrue() {
        sut.tripType = 0
        sut.returnDate = Date()
        
        XCTAssertFalse(sut.searchButtonDisabled)
    }
    
    func testSearchButtonDisabledRoundTripFalse() {
        sut.tripType = 1
        sut.startDate = Date()
        
        XCTAssertFalse(sut.searchButtonDisabled)
    }
    
    func testShowSourceAirportVew() {
        sut.isSourceAirportPickerPresented = false
        
        sut.showSourceAirportVew()
        
        XCTAssertTrue(sut.isSourceAirportPickerPresented)
        
    }
    
    func testShowDestinationAirportVewSuccess() {
        sut.sourceAirport =  MockApiResponseProvider.airportList.first
        
        XCTAssertTrue(sut.showDestinationAirportVew())
    }
    
    func testShowDestinationAirportVewFailed() {
        XCTAssertFalse(sut.showDestinationAirportVew())
    }
    
    func testShowTravelDatePickerSuccess() {
        sut.destinationAirport =  MockApiResponseProvider.airportList.first
        
        XCTAssertTrue(sut.showTravelDatePicker())
    }
    
    func testShowTravelDatePickerFailed() {
        XCTAssertFalse(sut.showTravelDatePicker())
    }
    
    func testShowPassengerPickerSuccess() {
        sut.startDate =  Date()
        
        XCTAssertTrue(sut.showPassengerPicker())
    }
    
    func testShowPassengerPickerFailed() {
        XCTAssertFalse(sut.showPassengerPicker())
    }
    
    func testFormattedDateWhenOnlyStartDateIsSet() {
        let dateString = "20 - 10 - 2023"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd - MM - yyyy"
        let sampleDate = dateFormatter.date(from: dateString)
        sut.startDate = sampleDate

        let formattedDate = sut.formattedSelectedDateString()

        XCTAssertEqual(formattedDate, "20 Oct 2023")
    }
    
    func testFormattedDateWhenBothStartDateAndReturnDateAreSet() {
        let dateString = "20 - 10 - 2023"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd - MM - yyyy"
        let sampleDate = dateFormatter.date(from: dateString)
        sut.startDate = sampleDate
        sut.returnDate = sampleDate

        let formattedDate = sut.formattedSelectedDateString()
        
        XCTAssertEqual(formattedDate, "20 Oct 2023 - 20 Oct 2023")
    }
}
