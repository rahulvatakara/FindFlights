//
//  StringExtension.swift
//  FindFlights
//
//  Created by Rahul C K on 21/10/23.
//

import Foundation
extension String {
    func convertDate(from inputFormat: String, to outputFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        
        if let date = dateFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = outputFormat
            return outputFormatter.string(from: date)
        }
        return ""
    }
}
