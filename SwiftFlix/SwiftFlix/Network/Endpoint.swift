//
//  Endpoint.swift
//  SwiftFlix
//
//  Created by karmic on 7/9/26.
//

import Foundation

enum Endpoint {
  case trending(mediaType: MediaType)
  case topRatedMovie
  case topRatedTv
  case search(query: String)

  var urlPath: String {
    switch self {
    case .trending(let mediaType):
      return "trending/\(mediaType.rawValue)/day"
    case .topRatedMovie:
      return "movie/top_rated"
    case .topRatedTv:
      return "tv/top_rated"
    case .search(let query)
      return "search/\(query)"
    }
  }
}
