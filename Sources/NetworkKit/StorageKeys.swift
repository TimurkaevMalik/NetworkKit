//
//  StorageKeys.swift
//  NetworkKit
//
//  Created by Malik Timurkaev on 03.10.2025.
//

import Foundation

public enum StorageKeys: String {
    case accessToken = "auth.access"
    case refreshToken = "auth.refresh"
    case currentUserID = "currentUserID"
    case accessTokenCreatedAt = "refreshTokenCreatedAt"
    case refreshTokenCreatedAt = "accessTokenCreatedAt"
}
