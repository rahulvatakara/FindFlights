//
//  SearchAPIHandler.swift
//  FindFlights
//
//  Created by Rahul C K on 17/10/23.
//

import Foundation
import Combine

protocol SearchAPIHandling {
    func fetchAirportList() -> Future<AirportsAPIResponse, Error>
    func fetchFlights(searchFlightParam: SearchFlightParameters) -> Future<FlightSearchResponse, Error>
}

extension NetworkHandler: SearchAPIHandling {
    /**
     Fetch fetchAirportList
     */
    func fetchAirportList() -> Future<AirportsAPIResponse, Error> {
        let endpoint = AppFeed.airportList
        let request = endpoint.request
        return fetch(request: request)
    }
    
    /**
     Fetch Flights
     */
    func fetchFlights(searchFlightParam: SearchFlightParameters) -> Future<FlightSearchResponse, Error> {
        let endpoint = AppFeed.searchFlights(param: searchFlightParam)
        let request = endpoint.request
        return fetch(request: request)
    }
}
