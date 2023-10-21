//
//  RecentSearchViewModel.swift
//  FindFlights
//
//  Created by Rahul C K on 21/10/23.
//

import Foundation

class RecentSearchViewModel: ObservableObject  {
    @Published var recentSearches: [SearchFlightParameters] = []
    private let recentSearchStorageHandler: RecentSearchStorageHandling
    
    init(recentSearchStorageHandler: RecentSearchStorageHandling = RecentSearchStorageHandler()) {
        self.recentSearchStorageHandler = recentSearchStorageHandler
    }
    
    func fetchRecentSearchs() {
        recentSearches = recentSearchStorageHandler.fetchAllRecentsSearches().map { $0.searchFlightParameters() }
    }

    func deleteRecentSearch(_ recentSearch: SearchFlightParameters) {
        recentSearchStorageHandler.deleteRecentsSearch(recentSearch)
    }
    
    func createFlightListView(recentSearch: SearchFlightParameters) -> FlightListingView {
        let viewModel = FlightListViewModel(searchFlightParameters: recentSearch)
        return FlightListingView(viewModel: viewModel)
    }
}
