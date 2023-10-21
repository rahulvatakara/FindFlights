//
//  RYStrings.swift
//  FindFlights 
//
//  Created by Rahul C K on 18/10/23.
//

import Foundation

enum RYStrings: String {
    case searchRoundTrip = "Round Trip"
    case searchTravelType = "Travel type"
    case searchOneWay = "One way"
    case searchPassengers = "Passengers"
    case searchFindFlights = "Find Flights"
    case searchLetsGo = "Let's Go"
    case searchFrom = "From"
    case searchTo = "To"
    case searchDate = "Date"
    case searchselectSourceAirport = "Select Source Airport"
    case searchselectDestinationAirport = "Select Destination Airport"
    case searchtitleAdults = "Adults"
    case searchsubTitleAdults = "16+ Years"
    case searchtitleTeens = "Teens"
    case searchsubTitleTeens = "12-15 years"
    case searchtitleChildren = "Children"
    case searchsubTitleChildren = "2-11 years"
    case searchtitleInfants = "Infants"
    case searchsubTitleInfants = "Under 2"
    case searchSelect = "Select"
    case searchBasic = "Basic"
    case done = "Done"
    case returnDate = "Return Date"
    case startDate = "Start Date"
    case noFlightFound = "No Flights Found"    
    case adjustSearchMessage = "Please adjust your search criteria and try again."
    case searchAirport = "Search Airport."
    case searchingFlights = "Searching for Flights..."

    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
