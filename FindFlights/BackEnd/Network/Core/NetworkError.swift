//
//  NetworkError.swift
//  FindFlights
//
//  Created by Rahul C K on 20/10/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}
