//
//  RecentSearchParameters.swift
//  FindFlights
//
//  Created by Rahul C K on 21/10/23.
//

import Foundation
extension RecentSearchParameters {
    func searchFlightParameters() -> SearchFlightParameters {
        return SearchFlightParameters(
            origin: self.origin ?? "",
            destination: self.destination ?? "",
            dateOut: self.dateOut ?? "",
            dateIn: self.dateIn,
            flexDaysBeforeOut: 3,
            flexDaysOut: 3,
            flexDaysBeforeIn: 3,
            flexDaysIn: 3,
            adultCount: Int8(self.adultCount),
            teenCount: Int8(self.teenCount),
            childCount: Int8(self.childCount),
            roundtrip: self.roundtrip,
            termsAgreed: "AGREED",
            discount: 0
        )
    }
}
