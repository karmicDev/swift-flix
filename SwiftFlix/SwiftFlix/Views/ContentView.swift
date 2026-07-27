//
//  ContentView.swift
//  SwiftFlix
//
//  Created by karmic on 7/5/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      TabView {
        Tab(Constants.Strings.home, systemImage: Constants.Icons.home) {
          HomeView()
        }
        Tab(Constants.Strings.upcoming, systemImage: Constants.Icons.upcoming) {
          UpcomingView()
        }
        Tab(Constants.Strings.search, systemImage: Constants.Icons.search) {
          SearchView()
        }
        Tab(Constants.Strings.download, systemImage: Constants.Icons.download) {
          Text(Constants.Strings.download)
        }
      }
    }
}

#Preview {
    ContentView()
}
