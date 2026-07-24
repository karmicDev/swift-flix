//
//  DataFetcher.swift
//  SwiftFlix
//
//  Created by karmic on 7/7/26.
//

import Foundation

struct DataFetcher {
  let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
  let tmdbApiKey = APIConfig.shared?.tmdbAPIKey

  // https://api.themoviedb.org/3/trending/tv/day?api_key=your-api-key
  func fetchTitle(for endPoint: Endpoint) async throws -> [Title] {
    guard let apiKey = tmdbApiKey else {
      throw NetworkError.missingConfig
    }
    let titlesURL = try URLBuilder.url(for: endPoint, and: apiKey)
    let (data, urlResponse) = try await URLSession.shared.data(from: titlesURL)

    guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
      throw NetworkError.badURLResponse(underlyingError: NSError(
        domain: "DataFetcher",
        code: (urlResponse  as? HTTPURLResponse)?.statusCode ?? -1,
        userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP Response"]
      ))
    }

    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    var titles = try decoder.decode(APIObject.self, from: data).results
    Constants.URLs.addPosterPath(to: &titles)

    return titles
  }
}
