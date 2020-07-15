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
    
    private func getUnderlyingError(error: Error, data: Data?) -> DataError {
        let isNetworkConnectionError = error.isNetworkConnetionError
        
        guard !isNetworkConnectionError else { return .noInternetConnection }
        guard let data = data else { return .undefined }
        
        do {
            let result = try decoder.decode(ErrorDataModel.self, from: data)
            return .underlying(error: result)
        } catch {
            return .dataCorrupted
        }
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
                    completion(.failure(dataError))
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
