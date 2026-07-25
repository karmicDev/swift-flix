//
//  TitleDetailView.swift
//  SwiftFlix
//
//  Created by karmic on 7/25/26.
//

import SwiftUI

struct TitleDetailView: View {
  let title: Title

  var body: some View {
    GeometryReader { geo in
      ScrollView {
        LazyVStack(alignment: .leading) {
          AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
            image
              .resizable()
              .scaledToFit()
          } placeholder: {
            ProgressView()
          }
          .frame(width: geo.size.width, height: geo.size.height * 0.85)

          Text(title.title ?? "")
            .bold()
            .font(.title2)
            .padding(4)
            .padding(.top, -20)
          Text(title.overview ?? "")
            .padding(4)
        }
      }
    }
  }
}

#Preview {
  TitleDetailView(title: Title.previewTitles[0])
}
