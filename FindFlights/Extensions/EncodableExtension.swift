//
//  EncodableExtension.swift
//  FindFlights 
//
//  Created by Rahul C K on 18/10/23.
//

import Foundation

extension Encodable {
    func asURLQueryItems() -> [URLQueryItem]? {
        let encoder = JSONEncoder()

        do {
            let data = try encoder.encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return nil
            }

            return dictionary.compactMap { key, value -> URLQueryItem? in
                guard let stringVal = value as? String else { return nil }
                return URLQueryItem(name: key, value: stringVal)
            }
        } catch {
            print("Encoding error: \(error)")
            return nil
        }
    }
}
