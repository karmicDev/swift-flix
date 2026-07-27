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
  let youtubeSearchURL = APIConfig.shared?.youtubeSearchURL
  let youtubeAPIKey = APIConfig.shared?.youtubeAPIKey

  // https://api.themoviedb.org/3/trending/tv/day?api_key=your-api-key
  // https://api.themoviedb.org/3/search/movie?api_key=your-api-key&query=PulpFiction
  func fetchTitle(for endPoint: Endpoint) async throws -> [Title] {
    guard let apiKey = tmdbApiKey else {
      throw NetworkError.missingConfig
    }
    let titlesURL = try URLBuilder.url(for: endPoint, and: apiKey)
    var titles = try await fetchAndDecode(url: titlesURL, type: TMDBAPIObject.self).results
    Constants.URLs.addPosterPath(to: &titles)
    return titles
  }

  func fetchVideoId(for title: String) async throws -> String {
    guard let baseSearchURL = youtubeSearchURL else {
      throw NetworkError.missingConfig
    }
    guard let apiKey = youtubeAPIKey else {
      throw NetworkError.missingConfig
    }

    let trailerSearch = title + YoutubeURLString.space.rawValue + YoutubeURLString.trailer.rawValue
    guard let fetchVideoURL = URL(string: baseSearchURL)?.appending(queryItems: [
      URLQueryItem(name: YoutubeURLString.queryShorten.rawValue, value: trailerSearch),
      URLQueryItem(name: YoutubeURLString.key.rawValue, value: apiKey)
    ]) else {
      throw NetworkError.urlBuildFailed
    }
    return try await fetchAndDecode(url: fetchVideoURL, type: YoutubeSearchResponse.self).items?.first?.id?.videoId ?? ""
  }

  func fetchAndDecode<T: Decodable>(url: URL, type: T.Type) async throws -> T {
    let (data, urlResponse) = try await URLSession.shared.data(from: url)
 
    guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
      throw NetworkError.badURLResponse(underlyingError: NSError(
        domain: "DataFetcher",
        code: (urlResponse  as? HTTPURLResponse)?.statusCode ?? -1,
        userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP Response"]
      ))
    }

    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try decoder.decode(type, from: data)
  }
}
