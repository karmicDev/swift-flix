//
//  URLPath.swift
//  SwiftFlix
//
//  Created by karmic on 7/10/26.
//

import Foundation

enum URLPath {
  case movie(id: Int)
  case tv(id: Int)
  case search(query: String)
  case trending(mediaType: MediaType)

  var absolute: String {
    switch self {
    case .movie(let id):
      return "movie/\(id)"
    case .tv(let id):
      return "tv/\(id)"
    case .trending(let mediaType):
      return "trending/\(mediaType.rawValue)/day"
    case .search(let query):
      return "search/\(query)"
    }
  }
}
