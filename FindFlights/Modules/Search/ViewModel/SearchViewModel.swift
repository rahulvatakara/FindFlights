//
//  SearchViewModel.swift
//  FindFlights 
//
//  Created by Rahul C K on 16/10/23.
//

import SwiftUI

final class SearchViewModel: ObservableObject {
    @Published var isPassengerPickerPresented: Bool = false
    @Published var isDestinationPickerPresented: Bool = false
    @Published var isSourceAirportPickerPresented: Bool = false
    @Published var isDatePickerPresented: Bool = false
    @Published var passengerDetails: PassengerDetails = .init()
    @Published var sourceAirport: AirPort?
    @Published var destinationAirport: AirPort?
    @Published var startDate: Date?
    @Published var returnDate: Date?
    @Published var tripType = 0
    
    var isRoundTrip: Bool {
        tripType == 0
    }

    var destinationAirportName: String {
        destinationAirport?.name ?? ""
    }

    var sourceAirportName: String {
        sourceAirport?.name ?? ""
    }

    var searchButtonDisabled: Bool {
        isRoundTrip ? (returnDate == nil): (startDate == nil)
    }

    // MARK: - View Presentation Methods
    func showSourceAirportVew() {
        isSourceAirportPickerPresented.toggle()
    }

    @discardableResult
    func showDestinationAirportVew() -> Bool {
        guard sourceAirport != nil else { return false }
        isDestinationPickerPresented.toggle()
        return true
    }

    @discardableResult
    func showTravelDatePicker() -> Bool {
        guard destinationAirport != nil else { return false }
        isDatePickerPresented.toggle()
        return true
    }

    @discardableResult
    func showPassengerPicker() -> Bool {
        guard startDate != nil else { return false }
        isPassengerPickerPresented.toggle()
        return true
    }

    // MARK: - Assembling Views
    func createAirportSelectionView(title: String, airport: Binding<AirPort?>) -> SelectAirportView {
        let viewModel = SelectAirportViewModel()
        return SelectAirportView(viewModel: viewModel,
                                 title: title,
                                 selectedAirport: airport)
    }

    func createPassengerCountView(for details: Binding<PassengerDetails>) -> PassengerCountPickerView {
        let viewModel = PassengerCountPickerViewModel(passengerDetails: details.wrappedValue)
        return PassengerCountPickerView(viewModel: viewModel,
                                        passengerDetails: details)
    }

    func createFlightListView() -> FlightListingView {
        let viewModel = FlightListViewModel(searchFlightParameters: constructFlightSearchParams())
        return FlightListingView(viewModel: viewModel)
    }
    
    // MARK: - Other
    func formattedSelectedDateString() -> String {
        guard let startDate = startDate else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        let startString = dateFormatter.string(from: startDate)
        if let returnDate = returnDate {
            let returnString = dateFormatter.string(from: returnDate)
            return "\(startString) - \(returnString)"
        } else {
            return startString
        }
    }

    private func constructFlightSearchParams() -> SearchFlightParameters {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let origin = sourceAirport?.code ?? ""
        let destination = destinationAirport?.code ?? ""
        
        let dateOut = dateFormatter.string(from: startDate ?? Date())
        var dateIn: String? = nil
        if let returnDate = returnDate {
            dateIn = dateFormatter.string(from: returnDate)
        }
        
        return SearchFlightParameters(
            origin: origin,
            destination: destination,
            dateOut: dateOut,
            dateIn: dateIn,
            flexDaysBeforeOut: 3,
            flexDaysOut: 3,
            flexDaysBeforeIn: 3,
            flexDaysIn: 3,
            adultCount: passengerDetails.numberOfAdults,
            teenCount: passengerDetails.numberOfTeens,
            childCount: passengerDetails.numberOfChildren,
            roundtrip: false,
            termsAgreed: "AGREED",
            discount: 0
        )
    }
}
