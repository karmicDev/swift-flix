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
  case searchMovie(query: String)
  case searchTV(query: String)

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
    case .searchMovie(let query):
      return "search/movie"
    case .searchTV(let query):
      return "search/tv"
    }
  }
}
