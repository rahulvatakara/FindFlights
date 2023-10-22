//
//  RecentSearchStorageHandler.swift
//  FindFlights
//
//  Created by Rahul C K on 21/10/23.
//

import Foundation
import CoreData

protocol RecentSearchStorageHandling {
    func fetchAllRecentsSearches() -> [RecentSearchParameters]
    func deleteRecentsSearch(_ searchParameters: SearchFlightParameters)
    func addRecentSearch(_ recentSearchParameters: SearchFlightParameters)
    func searchExists(for parameters: SearchFlightParameters) -> Bool
}

final class RecentSearchStorageHandler: RecentSearchStorageHandling {
    private let persistenceController: PersistenceController
    
    var viewContext: NSManagedObjectContext {
        return persistenceController.container.viewContext
    }
    
    init(persistenceController: PersistenceController = .shared) {
        self.persistenceController = persistenceController
    }
    
    func fetchAllRecentsSearches() -> [RecentSearchParameters] {
        let fetchRequest: NSFetchRequest<RecentSearchParameters> = RecentSearchParameters.fetchRequest()
        
        do {
            let recentSearches = try viewContext.fetch(fetchRequest)
            return recentSearches
        } catch {
            print("Failed to fetch recent searches: \(error)")
            return []
        }
    }
    
    func deleteRecentsSearch(_ searchParameters: SearchFlightParameters) {
        let fetchRequest: NSFetchRequest<RecentSearchParameters> = RecentSearchParameters.fetchRequest()
        fetchRequest.predicate = NSPredicate(
            format: "origin == %@ AND destination == %@ AND dateOut == %@ AND dateIn == %@",
            searchParameters.origin,
            searchParameters.destination,
            searchParameters.dateOut,
            searchParameters.dateIn ?? NSNull()
        )
        do {
            let matchingRecents = try viewContext.fetch(fetchRequest)
            for recentSearch in matchingRecents {
                viewContext.delete(recentSearch)
            }
            try viewContext.save()
        } catch {
            print("Failed to delete recent search: \(error)")
        }
    }
    
    
    func addRecentSearch(_ recentSearchParameters: SearchFlightParameters) {
        guard searchExists(for: recentSearchParameters) == false else {
            return
        }
        let recentSearch = RecentSearchParameters(context: viewContext)
        recentSearch.origin = recentSearchParameters.origin
        recentSearch.destination = recentSearchParameters.destination
        recentSearch.dateOut = recentSearchParameters.dateOut
        recentSearch.dateIn = recentSearchParameters.dateIn
        recentSearch.adultCount = Int16(recentSearchParameters.adultCount)
        recentSearch.teenCount = Int16(recentSearchParameters.teenCount)
        recentSearch.childCount = Int16(recentSearchParameters.childCount)
        recentSearch.roundtrip = recentSearchParameters.roundtrip
        do {
            try viewContext.save()
        } catch {
            print("Failed to save new recent search: \(error)")
        }
    }
    
    func searchExists(for parameters: SearchFlightParameters) -> Bool {
        let request: NSFetchRequest<RecentSearchParameters> = RecentSearchParameters.fetchRequest()
        let predicate = NSPredicate(format: "origin == %@ AND destination == %@", parameters.origin, parameters.destination)
        request.predicate = predicate
        do {
            let results = try viewContext.fetch(request)
            return results.count > 0
        } catch {
            print("Failed to fetch from Core Data: \(error)")
            return false
        }
    }
}
