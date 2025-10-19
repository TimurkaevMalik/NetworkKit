//
//  NetworkServiceHelper.swift
//  NetworkKit
//
//  Created by Malik Timurkaev on 19.10.2025.
//

import Foundation

public protocol NetworkServiceHelper: Sendable {
    func handle(response: URLResponse) throws
    func handle<T: Decodable>(data: Data) throws -> T
}

public final class DefaultNetworkServiceHelper: NetworkServiceHelper {
    
    private let decoder: JSONDecoder
    
    public init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
}

public extension DefaultNetworkServiceHelper {

    func handle(response: URLResponse) throws {
        guard let httpResp = response as? HTTPURLResponse else {
            throw NetworkError.transport(underlying: URLError(.badServerResponse))
        }
        
        guard (200...299).contains(httpResp.statusCode) else {
            throw NetworkError.httpStatus(httpResp.statusCode)
        }
    }
    
    func handle<T: Decodable>(data: Data) throws -> T {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed(underlying: error)
        }
    }
}
