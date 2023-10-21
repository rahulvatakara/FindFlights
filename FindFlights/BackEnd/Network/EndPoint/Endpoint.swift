//
//  Endpoint.swift
//  FindFlights
//
//  Created by Rahul C K on 17/10/23.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var headers: [String: String] { get }
    var queryItems: [URLQueryItem]? { get }
    var method: HTTPMethod { get }
}

extension Endpoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItems
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}

enum AppFeed {
    case airportList
    case searchFlights(param: SearchFlightParameters)
}

extension AppFeed: Endpoint {
    var headers: [String : String] {
        switch self {
        case .searchFlights(_):
            return [HTTPHeaderField.contentType: HTTPHeaderValue.json,
                    HTTPHeaderField.client: HTTPHeaderValue.iOS,
                    HTTPHeaderField.clientVersion : HTTPHeaderValue.version]
            
        default:
            return [:]
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case let .searchFlights(params):
            return params.asURLQueryItems()
            
        default:
            return nil
        }
    }
    
    var base: String {
        switch self {
        case .airportList:
            return "https://mobile-testassets-dev.s3.eu-west-1.amazonaws.com"
            
        case .searchFlights(_):
            return "https://nativeapps.ryanair.com"
        }
    }
    
    var path: String {
        switch self {
        case .airportList:
            return "/stations.json"
            
        case .searchFlights(_):
            return "/api/v4/Availability"
        }
    }
}
