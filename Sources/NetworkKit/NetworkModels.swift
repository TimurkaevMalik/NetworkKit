//
//  Host.swift
//  UnspAuthoriztion
//
//  Created by Malik Timurkaev on 27.09.2025.
//


import Foundation

public enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}

public enum Scheme: String {
    case https
}

public enum Host: String {
    case unsplash = "unsplash.com"
}

/// A lightweight, extensible path segment.
///
/// Add your own segments from other modules via `static let` in an extension:
/// ```swift
/// public extension Path {
///     static let sample1: Path = .segment("sample1")
///     static let sample2: Path = .segment("sample2")
/// }
///
/// // Usage
/// Path.build([.sample2, .sample1]) // "sample2/sample1"
/// ```
public enum Path {
    case segment(String)

    public var value: String {
        switch self {
        case .segment(let string): string
        }
    }

    public static func build(_ paths: [Path]) -> String {
        paths.map(\.value).joined(separator: "/")
    }
}
