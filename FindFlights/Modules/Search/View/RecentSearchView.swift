//
//  RecentSearchView.swift
//  FindFlights
//
//  Created by Rahul C K on 21/10/23.
//

import SwiftUI

struct RecentSearchView: View {
    
    @StateObject private var viewModel: RecentSearchViewModel

    init(viewModel: RecentSearchViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewModel.recentSearches, id: \.id) { recentSearch in
                    NavigationLink {
                        viewModel.createFlightListView(recentSearch: recentSearch)
                    } label: {
                        recentSearchItemView(recentSearch: recentSearch)
                    }
                }
            }.padding()
        }.onAppear {
            viewModel.fetchRecentSearchs()
        }
    }

    func recentSearchItemView(recentSearch: SearchFlightParameters) -> some View {
        VStack(alignment: .center) {
            HStack {
                Text(recentSearch.origin).font(.subheadline).fontWeight(.bold)
                Spacer()
                Image(systemName: recentSearch.roundtrip ? "arrow.left.arrow.right": "arrow.right")
                Spacer()
                Text(recentSearch.destination).font(.subheadline).fontWeight(.bold)
            }
            if recentSearch.roundtrip {
                Text("\(recentSearch.startDate) - \(recentSearch.returnDate)").font(.body).fontWeight(.regular)
            } else {
                Text("\(recentSearch.startDate)").font(.body).fontWeight(.regular)
            }
            HStack(alignment:.center) {
                Text("\(recentSearch.totalPassengers)").font(.body)
                Image(systemName: "person")
                Spacer()
            }
        }.accentColor(.black).padding(.horizontal, 30).padding(.vertical, 10).frame(width: 250).background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        ).overlay(alignment: .topTrailing) {
            Button {
                viewModel.deleteRecentSearch(recentSearch)
                viewModel.fetchRecentSearchs()
            } label: {
                Image(systemName: "xmark").font(.footnote)
                    .foregroundColor(.black)
            }.padding(6)
        }
    }
}

#Preview {
    RecentSearchView(viewModel: .init())
}
