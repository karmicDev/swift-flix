//
//  Errors.swift
//  SwiftFlix
//
//  Created by karmic on 7/6/26.
//

import Foundation

enum APIConfigError: Error, LocalizedError {
  case fileNotFound
  case dataLoadingFailed(underlyingError: Error)
  case decodingFailed(underlyingError: Error)

  var errorDescription: String? {
    switch self {
    case .fileNotFound:
      return "APIConfiguration not found."
    case .dataLoadingFailed(underlyingError: let error):
      return "Failed to load data from API configuration with error: \(error.localizedDescription)"
    case .decodingFailed(underlyingError: let error):
      return "Failed to decode API configuration with error: \(error.localizedDescription)"
    }
  }
}
