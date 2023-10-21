//
//  SearchBar.swift
//  FindFlights 
//
//  Created by Rahul C K on 17/10/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading, 8)
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(RYStrings.searchAirport.rawValue)
                        .foregroundColor(.gray)
                        .padding(7)
                }
                TextField("", text: $text)
                    .foregroundColor(.white)
                    .padding(7)
            }
        }
        .background(Color.gray.opacity(0.5))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar(text: .constant("Hello"))
}
