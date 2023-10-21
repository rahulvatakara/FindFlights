//
//  EmptySearchResultView.swift
//  FindFlights 
//
//  Created by Rahul C K on 20/10/23.
//

import SwiftUI

struct EmptySearchResultView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "airplane.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            
            Text(RYStrings.noFlightFound.rawValue)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(RYStrings.adjustSearchMessage.rawValue)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
    }
}

#Preview {
    EmptySearchResultView()
}
