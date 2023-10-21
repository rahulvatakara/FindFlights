//
//  FlightListView.swift
//  FindFlights 
//
//  Created by Rahul C K on 18/10/23.
//

import SwiftUI

struct FlightListingView: View {
    @StateObject var viewModel: FlightListViewModel

    init(viewModel: FlightListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        List {
            ForEach(viewModel.flights, id: \.id) { flightDetails in
                flightView(flightDetails: flightDetails)
            }
        }.listStyle(.grouped).navigationBarTitle(viewModel.flightListingViewtitle(),
                                                 displayMode: .large).onAppear {
            viewModel.fetchFlights()
        }.overlay(alignment: .center) {
            if viewModel.isLoading {
                LoadingSearchView()
            }
            else if viewModel.loadingFailed {
                EmptySearchResultView()
            } else {
                EmptyView()
            }
        }
    }
  
    func flightView(flightDetails: FlightDetails) -> some View {
        VStack {
            HStack(spacing: 10) {
                VStack(alignment: .center, spacing: 10) {
                    Text(viewModel.flightTimeFromDateString(flightDetails.departureTime))                        .font(.subheadline).fontWeight(.black)
                    Text(flightDetails.departureAirport).font(.caption2)
                }
                Spacer()
                VStack {
                    Text(flightDetails.flightDuration)
                        .font(.system(size: 10, weight: .regular))
                        .foregroundColor(.gray)
                    Divider()
                    Text(flightDetails.flightNumber)
                        .font(.system(size: 10, weight: .regular))
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment: .center, spacing: 10) {
                    Text(viewModel.flightTimeFromDateString(flightDetails.arrivalTime))
                        .font(.subheadline).fontWeight(.black)
                    Text(flightDetails.destinationAirport).font(.caption2)
                }
            }
            HStack(spacing: 5) {
                Text(RYStrings.searchBasic.rawValue).font(.subheadline)
                    .foregroundColor(.gray)
                Text(flightDetails.price).font(.subheadline)
                    .fontWeight(.bold).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }.padding().background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        ).overlay(alignment: .leading) {
            Rectangle().frame(width: 2)
                .foregroundColor(.yellow)
        }
    }
}
