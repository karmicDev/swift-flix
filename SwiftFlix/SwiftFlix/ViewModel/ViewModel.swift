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
  private(set) var videoIdStatus: FetchStatus = .notStarted
  private let dataFetcher = DataFetcher()
  var trendingMovies: [Title] = []
  var trendingTV: [Title] = []
  var topRatedMovies: [Title] = []
  var topRatedTV: [Title] = []
  var heroTitle = Title.previewTitles[0]
  var videoId = ""
  
  func getTitles() async {
    homeStatus = .fetching
    if trendingMovies.isEmpty {
      do {
        async let tMovies = dataFetcher.fetchTitle(for: .trendingMovie)
        async let tTV = dataFetcher.fetchTitle(for: .trendingTV)
        async let tRMovies = dataFetcher.fetchTitle(for: .topRatedMovie)
        async let tRTV = dataFetcher.fetchTitle(for: .topRatedTV)

        trendingMovies = try await tMovies
        trendingTV = try await tTV
        topRatedMovies = try await tRMovies
        topRatedTV = try await tRTV

        if let title = trendingMovies.randomElement() {
          heroTitle = title
        }

        homeStatus = .fetching
      } catch {
        print(error)
        homeStatus = .failed(underlayingError: error)
      }
    } else {
      homeStatus = .success
    }
  }
  
  func getVideoId(for title: String) async {
    videoIdStatus = .fetching
    do {
      videoId = try await dataFetcher.fetchVideoId(for: title)
      videoIdStatus = .success
    } catch {
      print(error)
      videoIdStatus = .failed(underlayingError: error)
    }
  }
}
