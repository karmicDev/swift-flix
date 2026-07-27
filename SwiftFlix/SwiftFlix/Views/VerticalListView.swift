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
        HStack {
          image
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 10))
            .padding(5)
          
          Text((title.title ?? title.name) ?? "")
            .font(.system(size: 14))
            .bold()
        }
        .frame(height: 150)
      } placeholder: {
        ProgressView()
      }
    }
  }
}

#Preview {
  VerticalListView(titles: Title.previewTitles)
}
