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
          Text(Constants.Strings.home)
        }
        Tab(Constants.Strings.upcoming, systemImage: Constants.Icons.upcoming) {
          Text(Constants.Strings.upcoming)
        }
        Tab(Constants.Strings.search, systemImage: Constants.Icons.search) {
          Text(Constants.Strings.search)
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
