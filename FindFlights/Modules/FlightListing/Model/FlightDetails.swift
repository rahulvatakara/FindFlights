//
//  FlightDetails.swift
//  FindFlights
//
//  Created by Rahul C K on 20/10/23.
//

import Foundation

public struct FlightDetails {
    var id = UUID()
    var departureTime: String
    var flightDuration: String
    var departureAirport: String
    var flightNumber: String
    var arrivalTime: String
    var destinationAirport: String
    var fareType: String?
    var price: String
    var destinationName: String
    var originName: String
}

public extension FlightSearchResponse {
    func extractFlightDetails() -> [FlightDetails] {
        return trips.flatMap { trip in
            trip.dates.flatMap { date in
                date.flights.map { flight in
                    let departureTime = flight.time.first ?? ""
                    let flightDuration = flight.duration
                    let departureAirport = trip.origin
                    let flightNumber = flight.flightNumber
                    let arrivalTime = flight.time.last ?? ""
                    let destinationAirport = trip.destination
                    let destinationName = trip.destinationName
                    let originName = trip.originName
                    let fareType = flight.regularFare.fares.first?.type
                    let price = "\(flight.regularFare.fares.first?.amount ?? 0.0) \(self.currency)"
                    
                    return FlightDetails(
                        departureTime: departureTime,
                        flightDuration: flightDuration,
                        departureAirport: departureAirport,
                        flightNumber: flightNumber,
                        arrivalTime: arrivalTime,
                        destinationAirport: destinationAirport,
                        fareType: fareType,
                        price: price,
                        destinationName: destinationName,
                        originName: originName
                    )
                }
            }
        }
    }
}
