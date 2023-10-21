//
//  FlightListViewModel.swift
//  FindFlights 
//
//  Created by Rahul C K on 18/10/23.
//

import Foundation
import Combine

final class FlightListViewModel: ObservableObject {
    private let searchAPIHandler: SearchAPIHandling
    private var cancellables = Set<AnyCancellable>()
    private var searchFlightParameters: SearchFlightParameters
    @Published var isLoading: Bool = false
    @Published var loadingFailed: Bool = false
    @Published var flights: [FlightDetails] = []
    
    init(searchAPIHandler: SearchAPIHandling = NetworkHandler(), searchFlightParameters: SearchFlightParameters) {
        self.searchAPIHandler = searchAPIHandler
        self.searchFlightParameters = searchFlightParameters
    }
    
    func fetchFlights() {
        self.isLoading = true
        searchAPIHandler.fetchFlights(searchFlightParam: searchFlightParameters)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                    
                case .failure(_):
                    self?.loadingFailed = true
                    break
                }
            } receiveValue: {  [weak self] response in
                self?.flights = response.extractFlightDetails()
                self?.loadingFailed = self?.flights.isEmpty ?? false
                
            }.store(in: &cancellables)
    }
    
    func flightTimeFromDateString(_ dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        guard let date = inputFormatter.date(from: dateString) else {
            return ""
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "HH:mm"
        return outputFormatter.string(from: date)
    }
    
    func flightListingViewtitle() -> String {
        if let flightDetails = flights.first {
            return "\(flightDetails.departureAirport) → \(flightDetails.destinationAirport)"
        } else {
            return "\(searchFlightParameters.origin) → \(searchFlightParameters.destination)"
            
        }
    }
}
