//
//  Movie.swift
//  SwiftFlix
//
//  Created by karmic on 7/6/26.
//

import Foundation

struct APIObject: Decodable {
  var results: [Movie] = []
}

struct Movie: Decodable, Identifiable {
  var adult: Bool?
  var backdropPath: String?
  var id: Int?
  var title: String?
  var originalTitle: String?
  var overview: String?
  var posterPath: String?
  var mediaType: String?
  var originalLanguage: String?
  var genre_ids: [Int] = []
  var popularity: Float?
  var release_date: String?
  var softcore: Bool?
  var video: Bool?
  var voteAverage: Float?
  var vote_count: Float?
}
