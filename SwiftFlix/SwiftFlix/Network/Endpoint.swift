//
//  Endpoint.swift
//  SwiftFlix
//
//  Created by karmic on 7/9/26.
//

import Foundation

enum Endpoint {
  case trendingMovie
  case trendingTV
  case topRatedMovie
  case topRatedTV
  case search(query: String)

  var urlPath: String {
    switch self {
    case .trendingMovie:
      return "trending/movie/day"
    case .trendingTV:
      return "trending/tv/day"
    case .topRatedMovie:
      return "movie/top_rated"
    case .topRatedTV:
      return "tv/top_rated"
    case .search(let query):
      return "search/\(query)"
    }
  }
}
