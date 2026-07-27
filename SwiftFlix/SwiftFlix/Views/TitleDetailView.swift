//
//  TitleDetailView.swift
//  SwiftFlix
//
//  Created by karmic on 7/25/26.
//

import SwiftUI

struct TitleDetailView: View {
  let title: Title
  var titleName: String {
    return (title.name ?? title.title) ?? ""
  }
  let viewModel = ViewModel()
  
  var body: some View {
    GeometryReader { geo in
      switch viewModel.videoIdStatus {
      case .notStarted:
        EmptyView()
      case .fetching:
        ProgressView()
          .frame(width: geo.size.width, height: geo.size.height)
      case .success:
        ScrollView {
          LazyVStack(alignment: .leading) {
            //YoutubePlayer(videoId: viewModel.videoId)
            //  .aspectRatio(1.3, contentMode: .fit)
            AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
              image
                .resizable()
                .scaledToFit()
            } placeholder: {
              ProgressView()
            }
            
            Text(titleName)
              .bold()
              .font(.title2)
              .padding(8)
              .padding(.top, 12)
            Text(title.overview ?? "")
              .padding(8)
          }
        }
        
      case .failed(let underlayingError):
        Text(underlayingError.localizedDescription)
      }
    }
    .task {
      print("titleName: \(titleName)")
      await viewModel.getVideoId(for: titleName)
    }
  }
}

#Preview {
  TitleDetailView(title: Title.previewTitles[0])
}
