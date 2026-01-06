//
//  Errors.swift
//  BlossomApp
//
//  Created by Jarvis on 31/12/25.
//

import Foundation

enum APIConfigError: Error, LocalizedError{
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String? {
        switch self{
        case .fileNotFound:
            return "API configuration not found"
        case .dataLoadingFailed(underlyingError: let error):
            return "Failed to load data from API configuration file. \(error.localizedDescription)"
        case .decodingFailed(underlyingError: let error):
            return "Failed to decode data from API configuration file. \(error.localizedDescription)"
        }
    }
}

enum NetworkError: Error, LocalizedError{
    case badURlResponse(underlyingError: Error)
    case missingConfig
    case urlBuildFailed
    
    var errorDescription: String?{
        switch self{
        case .badURlResponse(underlyingError: let error):
            return "Failed to parse URL response: \(error.localizedDescription)"
        case .missingConfig:
            return "Missing API configuration."
            
            case .urlBuildFailed:
            return "failed to build URL."
        }
        
    }
    
}
