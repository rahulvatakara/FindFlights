//
//  PassengerCountPickerViewModel.swift
//  FindFlights 
//
//  Created by Rahul C K on 16/10/23.
//

import Foundation

class PassengerCountPickerViewModel: ObservableObject {
    @Published var numberOfAdults: Int8
    @Published var numberOfTeens: Int8
    @Published var numberOfInfants: Int8
    @Published var numberOfChildren: Int8

    var minNumberOfAdults: Int8 {
        return 1
    }
    var minNumberOfSeats: Int8 {
        return 0
    }

    var maxNumberOfSeats: Int8 {
        return 6
    }

    init(numberOfAdults: Int8,
         numberOfTeens: Int8,
         numberOfInfants: Int8,
         numberOfChildren: Int8) {
        self.numberOfAdults = numberOfAdults
        self.numberOfTeens = numberOfTeens
        self.numberOfInfants = numberOfInfants
        self.numberOfChildren = numberOfChildren
    }

    convenience init(passengerDetails: PassengerDetails) {
        self.init(numberOfAdults: passengerDetails.numberOfAdults,
                  numberOfTeens: passengerDetails.numberOfTeens,
                  numberOfInfants: passengerDetails.numberOfInfants,
                  numberOfChildren: passengerDetails.numberOfChildren)
    }

    func passengersDetails() -> PassengerDetails {
        PassengerDetails(numberOfAdults: numberOfAdults,
                         numberOfTeens: numberOfTeens,
                         numberOfInfants: numberOfInfants,
                         numberOfChildren: numberOfChildren)
    }
}
