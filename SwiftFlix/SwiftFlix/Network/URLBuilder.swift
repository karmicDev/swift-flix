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

    guard let url = URL(string: baseURL)?
      .appending(path: endpoint.urlPath)
      .appending(queryItems: [
        URLQueryItem(name: "api_key", value: apiKey)
      ]) else {
      throw NetworkError.urlBuildFailed
    }

    return url
  }
}
