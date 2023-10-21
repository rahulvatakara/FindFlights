//
//  SearchView.swift
//  FindFlights
//
//  Created by Rahul C K on 16/10/23.
//

import SwiftUI
import TravelDatePicker
import FindFlightsInputField

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    
    init(viewModel: SearchViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView(content: {
            VStack(alignment: .center, spacing: 10) {
                travelTypeSelectionView
                sourceAirportPickerView
                destinationAirportView
                travelDatePickerView
                passengerPickerView
                searchButton
            }.padding(.horizontal, 20)
                .navigationBarTitle(RYStrings.searchFindFlights.rawValue,
                                    displayMode: .large)
        })
    }
    
    var searchButton: some View {
        NavigationLink {
            viewModel.createFlightListView()
        } label: {
            VStack {
                Text(RYStrings.searchLetsGo.rawValue)
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                    )
            }.foregroundColor(.yellow)
                .cornerRadius(25).padding(.horizontal,10)
                .padding(.vertical, 30)
        }.disabled(viewModel.searchButtonDisabled)
    }
    
    var passengerPickerView: some View {
        FindFlightsInputField<PassengerDetails>(fieldTitle: RYStrings.searchPassengers.rawValue,
                                               fieldValue: $viewModel.passengerDetails) {
            viewModel.showPassengerPicker()
            
        }.sheet(isPresented: $viewModel.isPassengerPickerPresented, content: {
            viewModel.createPassengerCountView(for: $viewModel.passengerDetails)
        })
    }
    
    var sourceAirportPickerView: some View {
        FindFlightsInputField<String>(fieldTitle: RYStrings.searchFrom.rawValue,
                                     fieldValue: .init(get: { viewModel.sourceAirportName},
                                                       set: { _ in})) {
            viewModel.showSourceAirportVew()
        }.sheet(isPresented: $viewModel.isSourceAirportPickerPresented, content: {
            viewModel.createAirportSelectionView(title: RYStrings.searchselectSourceAirport.rawValue,
                                                 airport: $viewModel.sourceAirport)
        })
    }
    
    var destinationAirportView: some View {
        FindFlightsInputField<String>(fieldTitle: RYStrings.searchTo.rawValue,
                                     fieldValue: .init(get: {
            viewModel.destinationAirportName
        }, set: { value in
            
        })) {
            viewModel.showDestinationAirportVew()
            
        }.sheet(isPresented: $viewModel.isDestinationPickerPresented, content: {
            viewModel.createAirportSelectionView(title:  RYStrings.searchselectDestinationAirport.rawValue,
                                                 airport: $viewModel.destinationAirport)
        })
    }
    
    var travelDatePickerView: some View {
        FindFlightsInputField<String>(fieldTitle: RYStrings.searchDate.rawValue,
                                     fieldValue: .init(get: {
            viewModel.formattedSelectedDateString()
        }, set: { _ in })) {
            viewModel.showTravelDatePicker()
            
        }.sheet(isPresented: $viewModel.isDatePickerPresented,
                content: {
            TravelDatePicker(startDate: $viewModel.startDate,
                             returnDate: $viewModel.returnDate,
                             isRoundTrip: viewModel.isRoundTrip)
        })
    }
    
    var travelTypeSelectionView: some View {
        Picker(RYStrings.searchTravelType.rawValue,
               selection: $viewModel.tripType) {
            Text(RYStrings.searchRoundTrip.rawValue).tag(0)
            Text(RYStrings.searchOneWay.rawValue).tag(1)
        }.pickerStyle(.segmented)
            .onChange(of: $viewModel.tripType.wrappedValue) { tag in
                viewModel.returnDate = nil
            }
    }
}

#Preview {
    SearchView()
}
