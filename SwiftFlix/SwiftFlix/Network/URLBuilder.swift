//
//  UrlBuilder.swift
//  SwiftFlix
//
//  Created by karmic on 7/9/26.
//

import Foundation

struct URLBuilder {
  static func url(for endpoint: Endpoint, and apiKey: String?) throws -> URL {
    guard let baseURL = tmdbBaseURL else {
      throw NetworkError.missingConfig
    }
    guard let apiKey = apiKey else {
      throw NetworkError.missingConfig
    }

    switch endpoint {
    case .trending(let mediaType):
      guard let titlesURL = URL(string: baseURL)?
        .appending(path: "trending/\(mediaType.rawValue)/day")
        .appending(queryItems: [
          URLQueryItem(name: "api_key", value: apiKey)
        ]) else {
        throw NetworkError.urlBuildFailed
      }
      return titlesURL
    case .movie(let id):
      guard let movieURL = URL(string: baseURL)?
        .appending(path: "movie/\(id)")
        .appending(queryItems: [
          URLQueryItem(name: "api_key", value: apiKey)
        ]) else {
        throw NetworkError.urlBuildFailed
      }
      return movieURL
    case .tv(let id):
      guard let movieURL = URL(string: baseURL)?
        .appending(path: "tv/\(id)")
        .appending(queryItems: [
          URLQueryItem(name: "api_key", value: apiKey)
        ]) else {
        throw NetworkError.urlBuildFailed
      }
      return movieURL
    case .search(let query):
      guard let searchURL = URL(string: baseURL)?
        .appending(path: "search/\(query)")
        .appending(queryItems: [
          URLQueryItem(name: "api_key", value: apiKey)
        ]) else {
        throw NetworkError.urlBuildFailed
      }
      return searchURL
    }
  }
}
