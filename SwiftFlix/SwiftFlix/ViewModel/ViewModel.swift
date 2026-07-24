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
      trendingMovies = try await dataFetcher.fetchTitle(for: .trendingMovie)
      trendingTV = try await dataFetcher.fetchTitle(for: .trendingTV)
      topRatedMovies = try await dataFetcher.fetchTitle(for: .topRatedMovie)
      topRatedTV = try await dataFetcher.fetchTitle(for: .topRatedTV)
      homeStatus = .success
    } catch {
      print(error)
      homeStatus = .failed(underlayingError: error)
    }
  }
}
