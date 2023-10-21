//
//  SelectAirportView.swift
//  FindFlights 
//
//  Created by Rahul C K on 17/10/23.
//

import SwiftUI

struct SelectAirportView: View {
    @StateObject var viewModel = SelectAirportViewModel()
    var title: String
    @Binding var selectedAirport: AirPort?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBar(text: $viewModel.searchText)
                .padding(.horizontal).padding(.top, 40)
            Spacer()
            List {
                ForEach(viewModel.filteredAccounts, id: \.self.code) { airport in
                    Button {
                        $selectedAirport.wrappedValue = airport
                        dismiss()
                    } label: {
                        airportView(airport: airport)
                    }
                }
            }.onAppear(perform: {
                viewModel.fetchAirports()
            })
        }.navigationBarTitle(title, displayMode: .large)
    }
    
    func airportView(airport: AirPort) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(airport.name)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(airport.countryName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(airport.code)
                .font(.subheadline)
                .foregroundColor(.blue)
        }
        
    }
}

#Preview {
    NavigationView(content: {
        
    })
}
