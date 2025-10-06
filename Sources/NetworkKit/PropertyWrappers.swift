//
//  PropertyWrappers.swift
//  NetworkKit
//
//  Created by Malik Timurkaev on 07.10.2025.
//

import Foundation

@propertyWrapper
public struct DefaultEmptyString: Decodable {
    public var wrappedValue: String
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(String.self)) ?? ""
    }
}
