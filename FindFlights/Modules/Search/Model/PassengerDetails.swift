//
//  PassengerDetails.swift
//  FindFlights 
//
//  Created by Rahul C K on 16/10/23.
//

import Foundation

struct PassengerDetails {
    let numberOfAdults: Int8
    let numberOfTeens: Int8
    let numberOfInfants: Int8
    let numberOfChildren: Int8

    init(numberOfAdults: Int8 = 1,
         numberOfTeens: Int8 = 0,
         numberOfInfants: Int8 = 0,
         numberOfChildren: Int8 = 0) {
        self.numberOfAdults = numberOfAdults
        self.numberOfTeens = numberOfTeens
        self.numberOfInfants = numberOfInfants
        self.numberOfChildren = numberOfChildren
    }
}

extension PassengerDetails: CustomStringConvertible {
    var description: String {
         let mappings: [(count: Int8, singular: String, plural: String)] = [
             (numberOfAdults, "Adult", "Adults"),
             (numberOfTeens, "Teen", "Teens"),
             (numberOfChildren, "Child", "Children"),
             (numberOfInfants, "Infant", "Infants")
         ]

         let descriptions = mappings
             .filter { $0.count > 0 }
             .map { "\($0.count) \($0.count > 1 ? $0.plural : $0.singular)" }

         return descriptions.joined(separator: ", ")
     }
}
