//
//  Errors.swift
//  SwiftUIMovie
//
//  Created by Saurabh on 24/12/25.
//

import Foundation


enum APIConfigError: Error, LocalizedError {
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "API Configuration file not found."
        case .dataLoadingFailed(underlyingError: let error):
            return "Failed to load data from API configuration file: \(error.localizedDescription)."
        case let .decodingFailed(underlyingError):
            return "Decoding failed: \(underlyingError.localizedDescription)."
        }
    }
}


enum NetworkError: Error, LocalizedError {
    case badURLResponse(underlyingError: Error)
    case missingConfig
    case urlBuildFailed
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse(underlyingError: let error):
            return "Failed to parse URL response: \(error.localizedDescription)."
        case .missingConfig:
            return "API Configuration is missing."
        case .urlBuildFailed:
            return "Failed to build URL."
        }
    }
}
