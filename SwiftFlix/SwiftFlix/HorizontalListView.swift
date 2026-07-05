//
//  SwiftUIView.swift
//  SwiftFlix
//
//  Created by karmic on 7/5/26.
//

import SwiftUI

struct HorizontalListView: View {
  let header = Constants.Strings.trendingMovies
  var titles = [Constants.URLs.testTitle,
                Constants.URLs.testTitle2,
                Constants.URLs.testTitle3]

    var body: some View {
      VStack(alignment: .leading) {
        Text(header)
          .font(.title)
        ScrollView(.horizontal) {
          LazyHStack {
            ForEach(titles, id:\.self) { title in
              AsyncImage(url: URL(string: title)) { image in
                image
                  .resizable()
                  .scaledToFit()
              } placeholder: {
                ProgressView()
              }
              .frame(width: 120, height: 200)
            }
          }
        }
      }
      .frame(height: 250)
      .padding(10)
    }
}

#Preview {
    HorizontalListView()
}
