//
//  Constants.swift
//  SwiftFlix
//
//  Created by karmic on 7/5/26.
//

import Foundation
import SwiftUI

struct Constants {
  struct Strings {
    static let home = "Home"
    static let upcoming = "Upcoming"
    static let search = "Search"
    static let download = "Download"
    static let play = "Play"
    static let trendingMovies = "Trending Movies"
  }
  
  struct Icons {
    static let home = "house"
    static let upcoming = "play.circle"
    static let search = "magnifyingglass"
    static let download = "arrow.down.to.line"
  }
  
  struct URLs {
    static let testTitle = "https://image.tmdb.org/t/p/w500/nnl6OWkyPpuMm595hmAxNW3rZFn.jpg"
    static let testTitle2 = "https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg"
    static let testTitle3 = "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg"
  }
}

extension Text {
  func ghostButton() -> some View {
    self
      .frame(width: 100, height: 50)
      .foregroundStyle(.buttonText)
      .bold()
      .background {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
          .stroke(.buttonBorder, lineWidth: 5)
      }
  }
}
