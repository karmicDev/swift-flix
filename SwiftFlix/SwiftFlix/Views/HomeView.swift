//
//  HomeView.swift
//  SwiftFlix
//
//  Created by karmic on 7/5/26.
//

import SwiftUI

struct HomeView: View {
  let viewModel = ViewModel()
  @State private var titleDetailPath = NavigationPath()

  var body: some View {
    NavigationStack(path: $titleDetailPath) {
      GeometryReader { geo in
        ScrollView(.vertical) {
          switch viewModel.homeStatus {
          case .notStarted:
            EmptyView()
          case .fetching:
            ProgressView()
              .frame(
                width: geo.size.width,
                height: geo.size.height,
                alignment: .center
              )
          case .success:
            LazyVStack {
              AsyncImage(url: URL(string: viewModel.heroTitle.posterPath ?? "")) { image in
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
                  titleDetailPath.append(viewModel.heroTitle)
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
              HorizontalListView(
                header: Constants.Strings.trendingMovies,
                titles: viewModel.trendingMovies) { title in
                  titleDetailPath.append(title)
                }
              HorizontalListView(
                header: Constants.Strings.trendingTV,
                titles: viewModel.trendingTV) { title in
                  titleDetailPath.append(title)
                }
              HorizontalListView(
                header: Constants.Strings.topRatedMovies,
                titles: viewModel.topRatedMovies) { title in
                  titleDetailPath.append(title)
                }
              HorizontalListView(
                header: Constants.Strings.topRatedTV,
                titles: viewModel.topRatedTV) { title in
                  titleDetailPath.append(title)
                }
            }
          case .failed(let error):
            Text("Error: \(error.localizedDescription)")
          }
        }
        .task {
          await viewModel.getTitles()
        }
        .navigationDestination(for: Title.self) { title in
          TitleDetailView(title: title)
        }
      }
    }
  }
}

#Preview {
  HomeView()
}
