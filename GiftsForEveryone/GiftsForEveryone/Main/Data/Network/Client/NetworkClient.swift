//
//  NetworkClient.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

protocol NetworkClient: class {
    
    func request<T: Decodable>(service: NetworkService, completion: @escaping (Result<T, DataError>) -> Void) -> Cancelable?
}

final class DefaultNetworkClient {
    
    private let session: URLSession
    
    private let decoder: JSONDecoder
    
    init(session: URLSession, decoder: JSONDecoder) {
        self.session = session
        self.decoder = decoder
    }
    
    private func decode<T: Decodable>(type: T.Type, data: Data) -> Result<T, DataError> {
        do {
            let result = try decoder.decode(T.self, from: data)
            return .success(result)
        } catch {
            return .failure(.dataCorrupted)
        }
    }
    
    private func getUnderlyingError(error: Error, data: Data?) -> ErrorDataModel {
        return .init(error: "")
    }
}

extension DefaultNetworkClient: NetworkClient {
    
    func request<T: Decodable>(service: NetworkService, completion: @escaping (Result<T, DataError>) -> Void) -> Cancelable? {
        
        let networkTask = NetworkTask()
        let urlRequest = UserService.me.asUrlRequest()
        
        networkTask.task = session.dataTask(with: urlRequest) { [weak self] (data: Data?, response: URLResponse?, error: Error?) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let error = error {
                    let dataError = self.getUnderlyingError(error: error, data: data)
                    completion(.failure(.underlying(error: dataError)))
                } else if let data = data {
                    let result = self.decode(type: T.self, data: data)
                    completion(result)
                } else {
                    completion(.failure(.undefined))
                }
            }
        }
        
        networkTask.resume()
        
        return networkTask
    }
}
