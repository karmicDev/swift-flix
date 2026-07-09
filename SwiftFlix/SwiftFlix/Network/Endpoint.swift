//
//  Endpoint.swift
//  SwiftFlix
//
//  Created by karmic on 7/9/26.
//

import Foundation

enum Endpoint {
  case trending(mediaType: MediaType)
  case movie(id: Int)
  case tv(id: Int)
  case search(query: String)
}
