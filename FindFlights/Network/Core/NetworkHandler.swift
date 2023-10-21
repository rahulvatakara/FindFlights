//
//  NetworkHandler.swift
//  FindFlights
//
//  Created by Rahul C K on 17/10/23.
//
import Foundation
import Combine

final class NetworkHandler {
    private let session: URLSession
    private var cancellables = Set<AnyCancellable>()
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetch<T: Decodable>(request: URLRequest) -> Future<T, Error> {
        return Future<T, Error> { [weak self] promise in
            guard let self = self else { return promise(.failure(NetworkError.unknown)) }
            session.dataTaskPublisher(for: request)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: { promise(.success($0)) })
                .store(in: &self.cancellables)
        }
    }
}
