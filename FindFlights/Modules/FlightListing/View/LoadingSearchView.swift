//
//  LoadingSearchView.swift
//  FindFlights 
//
//  Created by Rahul C K on 20/10/23.
//

import SwiftUI

struct LoadingSearchView: View {
    var body: some View {
        VStack(spacing: 20) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(2)
            
            Text(RYStrings.searchingFlights.rawValue)
                .font(.headline)
                .foregroundColor(.gray)
        }
    }
}


#Preview {
    LoadingSearchView()
}
