//
//  ApiTests.swift
//  SwiftFlixTests
//
//  Created by karmic on 7/9/26.
//

import Testing
internal import Foundation
@testable import SwiftFlix

struct ApiTests {
  @Test
  func trendingURL() throws {
    let url = try URLBuilder().url(for: .trending(mediaType: .movie), and: tmdbApiKey)
    #expect(url.scheme == "https")
    #expect(url.host == "api.themoviedb.org")
    #expect(url.path == "/3/trending/movie/day")
  

    let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
    guard let apiKey = tmdbApiKey else {
      throw APIConfigError.fileNotFound
    }
    print("url: " + url.absoluteString)
    #expect(components?.queryItems?.contains(
      URLQueryItem(name: "api_key", value: apiKey)
    ) == true
    )
  }
}
