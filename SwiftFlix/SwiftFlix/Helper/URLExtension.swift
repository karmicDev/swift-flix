//
//  URLExtension.swift
//  SwiftFlix
//
//  Created by karmic on 7/9/26.
//

import Foundation

extension URL {
  func appendingTMDBApiKey(_ apiKey: String) -> URL {
    appending(queryItems: [
      URLQueryItem(name: "api_key", value: apiKey)
    ])
  }
}
