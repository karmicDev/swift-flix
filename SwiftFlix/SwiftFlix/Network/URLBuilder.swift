//
//  UrlBuilder.swift
//  SwiftFlix
//
//  Created by karmic on 7/9/26.
//

import Foundation

struct URLBuilder {
  static func url(for endpoint: Endpoint, and apiKey: String?) throws -> URL {
    guard let baseURL = APIConfig.shared?.tmdbBaseURL else {
      throw NetworkError.missingConfig
    }
    guard let apiKey = apiKey else {
      throw NetworkError.missingConfig
    }

    switch endpoint {
    case .trending(let mediaType):
      guard let titlesURL = URL(string: baseURL)?
        .appending(path: endpoint.urlPath)
        .appending(queryItems: [
          URLQueryItem(name: "api_key", value: apiKey)
        ]) else {
        throw NetworkError.urlBuildFailed
      }
      return titlesURL
    case .topRatedMovie:
      guard let movieURL = URL(string: baseURL)?
        .appending(path: endpoint.urlPath)
        .appending(queryItems: [
          URLQueryItem(name: "api_key", value: apiKey)
        ]) else {
        throw NetworkError.urlBuildFailed
      }
      return movieURL
    case .topRatedTv:
      guard let movieURL = URL(string: baseURL)?
        .appending(path: endpoint.urlPath)
        .appending(queryItems: [
          URLQueryItem(name: "api_key", value: apiKey)
        ]) else {
        throw NetworkError.urlBuildFailed
      }
      return movieURL
    case .search(let query):
      guard let searchURL = URL(string: baseURL)?
        .appending(path: endpoint.urlPath)
        .appending(queryItems: [
          URLQueryItem(name: "api_key", value: apiKey)
        ]) else {
        throw NetworkError.urlBuildFailed
      }
      return searchURL
    }
  }
}
