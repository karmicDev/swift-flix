//
//  VerticalListView.swift
//  SwiftFlix
//
//  Created by karmic on 7/27/26.
//

import SwiftUI

struct VerticalListView: View {
  var titles: [Title]
  
  var body: some View {
    List(titles) { title in
      AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
        image
          .resizable()
          .scaledToFit()
          .clipShape(.rect(cornerRadius: 10))
          .padding(5)
      } placeholder: {
        ProgressView()
      }
    }
  }
}

#Preview {
  VerticalListView(titles: Title.previewTitles)
}
