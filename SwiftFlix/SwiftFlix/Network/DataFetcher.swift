//
//  DataFetcher.swift
//  SwiftFlix
//
//  Created by karmic on 7/7/26.
//

import Foundation

let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
let tmdbApiKey = APIConfig.shared?.tmdbAPIKey

// https://api.themoviedb.org/3/trending/tv/day?api_key=your-api-key
func fetchTitle(for mediaType: MediaType) async throws -> [Title] {
  guard let baseURL = tmdbBaseURL else {
    throw NetworkError.missingConfig
  }
  guard let apiKey = tmdbApiKey else {
    throw NetworkError.missingConfig
  }

  let fetchTitlesURL = URL(string: baseURL)?
    .appending(path: "trending/\(mediaType.rawValue)/day")
    .appending(queryItems: [
      URLQueryItem(name: "api_key", value: apiKey)
    ])
  
  print("fetchTitlesURL: " + (fetchTitlesURL?.absoluteString ?? "nil"))
  return []
}
