//
//  SearchViewModel.swift
//  SwiftFlix
//
//  Created by karmic on 7/27/26.
//

import Foundation

@Observable
class SearchViewModel {
  private(set) var errorMessage: String?
  private(set) var searchTitles: [Title] = []
  private let dataFetcher = DataFetcher()

  func getSearchTitles(for query: String) async {
    do {
      errorMessage = nil
      if query.isEmpty {
        searchTitles = try await dataFetcher.fetchTitle(for: .trendingMovie)
      } else {
        searchTitles = try await dataFetcher.fetchTitle(for: .searchMovie(query: query))
      }
    } catch {
      print(error)
      errorMessage = error.localizedDescription
    }
  }
}
