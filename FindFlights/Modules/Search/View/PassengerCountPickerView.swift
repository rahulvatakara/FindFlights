//
//  PassengerCountPickerView.swift
//  FindFlights
//
//  Created by Rahul C K on 16/10/23.
//

import SwiftUI

struct PassengerCountPickerView: View {
    
    @StateObject var viewModel: PassengerCountPickerViewModel
    @Binding var passengerDetails: PassengerDetails
    @Environment(\.dismiss) var dismiss
    
    init(viewModel: PassengerCountPickerViewModel, passengerDetails: Binding<PassengerDetails>) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _passengerDetails = passengerDetails
    }
    
    var body: some View {
        VStack {
            List {
                selectionView(title: RYStrings.searchtitleAdults.rawValue,
                              subTitle: RYStrings.searchsubTitleAdults.rawValue,
                              minimumValue: 1,
                              numberOfSeats: $viewModel.numberOfAdults)
                
                selectionView(title: RYStrings.searchtitleTeens.rawValue,
                              subTitle: RYStrings.searchsubTitleTeens.rawValue,
                              numberOfSeats: $viewModel.numberOfTeens)
                
                selectionView(title: RYStrings.searchtitleChildren.rawValue,
                              subTitle: RYStrings.searchsubTitleChildren.rawValue,
                              numberOfSeats: $viewModel.numberOfChildren)
                
                selectionView(title: RYStrings.searchtitleInfants.rawValue,
                              subTitle: RYStrings.searchsubTitleInfants.rawValue,
                              numberOfSeats: $viewModel.numberOfInfants)
                
            }
            selectButton
        }
        
    }
    
    var selectButton: some View {
        Button(action: {
            $passengerDetails.wrappedValue = viewModel.passengersDetails()
            dismiss()
        }) {
            Text(RYStrings.searchSelect.rawValue)
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                )
        }
        .background(Color.blue)
        .cornerRadius(25).padding(20)
    }
    
    @ViewBuilder
    func selectionView(title: String, subTitle: String, minimumValue: Int8 = 0, numberOfSeats: Binding<Int8>) -> some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 10) {
                Text(title).font(.title3)
                    .fontWeight(.semibold)
                Text(subTitle)
                    .font(.body)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Button(action: {
                numberOfSeats.wrappedValue -= 1
            } , label: {
                Image(systemName: "minus.circle.fill")
                    .font(.title)
                    .foregroundColor(.blue)
                
            }).buttonStyle(.borderless)
                .disabled(numberOfSeats.wrappedValue == minimumValue)
            Text("\(numberOfSeats.wrappedValue)")
                .font(.title3)
                .fontWeight(.regular).frame(width: 20)
            
            Button(action: {
                numberOfSeats.wrappedValue += 1
            } , label: {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .foregroundColor(.blue)
                
            }).buttonStyle(.borderless)
                .foregroundColor((numberOfSeats.wrappedValue == 6) ? .red : .white)
                .disabled(numberOfSeats.wrappedValue == 6)
        }
    }
}

#Preview {
    PassengerCountPickerView(viewModel: PassengerCountPickerViewModel(passengerDetails: .init()), passengerDetails: .constant(.init()))
}
