//
//  URLPath.swift
//  SwiftFlix
//
//  Created by karmic on 7/10/26.
//

import Foundation

enum URLPath {
  case topRatedMovie
  case topRatedTv
  case search(query: String)
  case trending(mediaType: MediaType)

  var absolute: String {
    switch self {
    case .topRatedMovie:
      return "movie/top_rated"
    case .topRatedTv:
      return "tv/top_rated"
    case .trending(let mediaType):
      return "trending/\(mediaType.rawValue)/day"
    case .search(let query):
      return "search/\(query)"
    }
  }
}
