//
//  URLPath.swift
//  SwiftFlix
//
//  Created by karmic on 7/10/26.
//

import Foundation

enum URLPath {
  case topRatedMovie(id: Int)
  case topRatedTv(id: Int)
  case search(query: String)
  case trending(mediaType: MediaType)

  var absolute: String {
    switch self {
    case .topRatedMovie(let id):
      return "movie/top_rated\(id)"
    case .topRatedTv(let id):
      return "tv/top_rated\(id)"
    case .trending(let mediaType):
      return "trending/\(mediaType.rawValue)/day"
    case .search(let query):
      return "search/\(query)"
    }
  }
}
