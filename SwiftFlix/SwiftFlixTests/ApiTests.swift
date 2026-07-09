//
//  ApiTests.swift
//  SwiftFlixTests
//
//  Created by karmic on 7/9/26.
//

import Testing
@testable import SwiftFlix

struct ApiTests {

    @Test func buildURL() async throws {
        
    }
  
  @Test func buildTrendingURL() throws {
    let url = try fetchTitle(for: MediaType.movie).trendingURL(
              baseURL: "https://api.themoviedb.org/3",
              mediaType: .movie,
              apiKey: "123456"
          )

          #expect(url.scheme == "https")
          #expect(url.host == "api.themoviedb.org")
          #expect(url.path == "/3/trending/movie/day")

          let components = URLComponents(url: url, resolvingAgainstBaseURL: false)

          #expect(
              components?.queryItems?.contains(
                  URLQueryItem(name: "api_key", value: "123456")
              ) == true
          )
      }
}
