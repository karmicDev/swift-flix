//
//  ViewModel.swift
//  SwiftFlix
//
//  Created by karmic on 7/24/26.
//

import Foundation

@Observable

class ViewModel {
  enum  FetchStatus {
    case notStarted
    case fetching
    case success
    case failed(underlayingError: Error)
  }

  private(set) var homeStatus: FetchStatus = .notStarted
  private let dataFetcher = DataFetcher()
  var trendingMovies: [Title] = []
  var trendingTV: [Title] = []
  var topRatedMovies: [Title] = []
  var topRatedTV: [Title] = []
  
  func getTitles() async {
    homeStatus = .fetching

    do {
      async let tMovies = dataFetcher.fetchTitle(for: .trendingMovie)
      async let tTV = dataFetcher.fetchTitle(for: .trendingTV)
      async let tRMovies = dataFetcher.fetchTitle(for: .topRatedMovie)
      async let tRTV = dataFetcher.fetchTitle(for: .topRatedTV)

      trendingMovies = try await tMovies
      trendingTV = try await tTV
      topRatedMovies = try await tRMovies
      topRatedTV = try await tRTV

      homeStatus = .success
    } catch {
      print(error)
      homeStatus = .failed(underlayingError: error)
    }
  }
}
