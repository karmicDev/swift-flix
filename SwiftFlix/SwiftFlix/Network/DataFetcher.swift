//
//  DataFetcher.swift
//  SwiftFlix
//
//  Created by karmic on 7/7/26.
//

import Foundation

let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
let tmdbApiKey = APIConfig.shared?.tmdbAPIKey

// https://api.themoviedb.org/3/trending/tv/day?api_key=your-api-key
func fetchTitle(for mediaType: MediaType) async throws -> [Title] {
   guard let apiKey = tmdbApiKey else {
     throw NetworkError.missingConfig
   }

   let titlesURL = try URLBuilder.url(for: .trending(mediaType: .movie), and: apiKey)
   return []
 }
 
