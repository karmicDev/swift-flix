//
//  YoutubeSearchResponse.swift
//  SwiftFlix
//
//  Created by karmic on 7/25/26.
//

import Foundation

struct YoutubeSearchResponse: Codable {
  let items: [ItemProperties]?
}

struct ItemProperties: Codable {
  let id: IdProperties?
}

struct IdProperties: Codable {
  let videoId: String?
}
