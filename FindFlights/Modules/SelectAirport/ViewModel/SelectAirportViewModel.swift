//
//  SelectAirportViewModel.swift
//  FindFlights
//
//  Created by Rahul C K on 17/10/23.
//

import Foundation
import Combine

final class SelectAirportViewModel: ObservableObject {
    private let searchAPIHandler: SearchAPIHandling
    private var cancellables = Set<AnyCancellable>()
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var airports: [AirPort] = []
    
    init(searchAPIHandler: SearchAPIHandling = NetworkHandler()) {
        self.searchAPIHandler = searchAPIHandler
    }
    
    var filteredAccounts: [AirPort] {
        if searchText.isEmpty {
            return airports
        } else {
            return airports.filter { $0.name.lowercased().contains(searchText.lowercased()) || $0.code.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func fetchAirports() {
        self.isLoading = true
        searchAPIHandler.fetchAirportList()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                    
                case .failure(_):
                    break
                }
            } receiveValue: {  [weak self] response in
                self?.airports = response.stations
            }.store(in: &cancellables)
    }
}
