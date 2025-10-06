//
//  NetworkError.swift
//  NetworkKit
//
//  Created by Malik Timurkaev on 07.10.2025.
//

import Foundation

enum NetworkError: Error, Sendable {
    case invalidURL
    case httpStatus(Int, Data? = nil)
    case decodingFailed(underlying: Error)
    case transport(underlying: Error)
}
