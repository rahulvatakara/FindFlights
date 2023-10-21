//
//  Constants.swift
//  FindFlights 
//
//  Created by Rahul C K on 18/10/23.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    case head = "HEAD"
    case options = "OPTIONS"
    case trace = "TRACE"
    case connect = "CONNECT"
}

struct HTTPHeaderField {
    static let contentType = "Content-type"
    static let client = "client"
    static let clientVersion = "client-version"
}

struct HTTPHeaderValue {
    static let json = "application/json"
    static let iOS = "ios"
    static let version = "3.999.0"
}
