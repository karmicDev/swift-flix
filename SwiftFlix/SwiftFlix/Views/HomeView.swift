//
//  HomeView.swift
//  SwiftFlix
//
//  Created by karmic on 7/5/26.
//

import SwiftUI

struct HomeView: View {
  let viewModel = ViewModel()

  var body: some View {
    GeometryReader { geo in
      ScrollView(.vertical) {
        switch viewModel.homeStatus {
        case .notStarted:
          EmptyView()
        case .fetching:
          ProgressView()
        case .success:
          LazyVStack {
            AsyncImage(url: URL(string: Constants.URLs.testTitle)) { image in
              image
                .resizable()
                .scaledToFit()
                .overlay {
                  LinearGradient(
                    stops: [Gradient.Stop(color: .clear, location: 0.8),
                            Gradient.Stop(color: .gradient, location: 1)],
                    startPoint: .top,
                    endPoint: .bottom)
                }
            } placeholder: {
              ProgressView()
            }
            .frame(width: geo.size.width, height: geo.size.height * 0.85)
            HStack {
              Button {
              } label: {
                Text(Constants.Strings.play)
                  .ghostButton()
              }
              Button {
              } label: {
                Text(Constants.Strings.download)
                  .ghostButton()
              }
            }
            HorizontalListView(header: Constants.Strings.trendingMovies, titles: viewModel.trendingMovies)
            //HorizontalListView(header: Constants.Strings.trendingTV)
            //HorizontalListView(header: Constants.Strings.topRatedMovies)
            //HorizontalListView(header: Constants.Strings.topRatedTV)
          }
        case .failed(let error):
          Text("Error: \(error.localizedDescription)")
        }
      }
      .task {
        await viewModel.getTitles()
      }
    }
  }
}

#Preview {
  HomeView()
}
