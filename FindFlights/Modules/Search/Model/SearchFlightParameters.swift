//
//  SearchFlightParams.swift
//  FindFlights 
//
//  Created by Rahul C K on 18/10/23.
//

import Foundation

struct SearchFlightParameters: Encodable {
    let origin: String
    let destination: String
    let dateOut: String
    let dateIn: String?
    let flexDaysBeforeOut: Int
    let flexDaysOut: Int
    let flexDaysBeforeIn: Int
    let flexDaysIn: Int
    let adultCount: Int8
    let teenCount: Int8
    let childCount: Int8
    let roundtrip: Bool
    let termsAgreed: String
    let discount: Int
    
    enum CodingKeys: String, CodingKey {
        case origin
        case destination
        case dateOut = "dateout"
        case dateIn = "datein"
        case flexDaysBeforeOut = "flexdaysbeforeout"
        case flexDaysOut = "flexdaysout"
        case flexDaysBeforeIn = "flexdaysbeforein"
        case flexDaysIn = "flexdaysin"
        case adultCount = "adt"
        case teenCount = "teen"
        case childCount = "chd"
        case roundtrip
        case termsAgreed = "ToUs"
        case discount = "Disc"
    }
}
