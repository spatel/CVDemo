//
//  CVDataService.swift
//  CVDemo
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation

// MARK: - CVDataServiceType (protocol)
protocol CVDataServiceType {
    
    func getCV(completion: @escaping (Result<CVModel, Error>) -> Void)
}

// MARK: - CVDataService (implementation)
struct CVDataService: CVDataServiceType {
    
    static let `default` = CVDataService(baseURL: URL(string: "https://pastebin.com/")!)
    
    private let baseURL: URL
    private let session: URLSession
    private let jsonDecoder: JSONDecoder
    private let completionQueue: DispatchQueue
    
    init(baseURL: URL,
         session: URLSession = .shared,
         jsonDecoder: JSONDecoder = JSONDecoder(),
         completionQueue: DispatchQueue = .main) {
        self.baseURL = baseURL
        self.session = session
        self.jsonDecoder = jsonDecoder
        jsonDecoder.dateDecodingStrategy = .iso8601
        self.completionQueue = completionQueue
    }
    
    func getCV(completion: @escaping (Result<CVModel, Error>) -> Void) {
        let path = "raw/1qKFxMCZ"
        let url = URL(string: path, relativeTo: baseURL)!
        executeGETRequest(url: url, completion: completion)
    }
    
    // ********************************************************************************************
    // NOTE: This code could obviously be moved elsewhere and reused for all requests e.g. PUT/POST/DELETE etc...
    // You could also obviously use 3rd party libraries like AlamoFire etc to improve this
    // ********************************************************************************************
    private func executeGETRequest<T: Decodable>(url requestURL: URL, completion: @escaping (Result<T, Error>) -> Void) {
        
        func finishTask(with result: Result<T, Error>) {
            completionQueue.async {
                completion(result)
            }
        }
        
        let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
            
            guard let response = response, let data = data else {
                self.completionQueue.async {
                    finishTask(with: .failure(error ?? ServiceError.unknown))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                finishTask(with: .failure(ServiceError.nonHTTPResponse))
                return
            }
            
            guard 200..<300 ~= httpResponse.statusCode else {
                finishTask(with: .failure(ServiceError.responseError))
                return
            }
            
            do {
                let decodedObject = try self.jsonDecoder.decode(T.self, from: data)
                finishTask(with: .success(decodedObject))
            } catch {
                finishTask(with: .failure(ServiceError.serializationError))
            }
        }
        
        dataTask.resume()
    }
}


enum ServiceError: Error {
    case unknown, nonHTTPResponse, responseError, serializationError
}
