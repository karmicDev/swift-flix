//
//  SearchView.swift
//  SwiftFlix
//
//  Created by karmic on 7/27/26.
//

import SwiftUI

struct SearchView: View {
  var titles = Title.previewTitles
  @State private var searchByMovies = true
  @State private var searchText = ""
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
          ForEach(titles) { title in
            AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
              image
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 10))
            } placeholder: {
              ProgressView()
            }
            .frame(width: 120, height: 200)        
          }
        }
      }
      .navigationTitle(
        searchByMovies ? Constants.Strings.searchMovie : Constants.Strings.searchTV
      )
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            searchByMovies.toggle()
          } label: {
            Image(systemName: searchByMovies ? Constants.Icons.movie : Constants.Icons.tv)
          }
        }
      }
      .searchable(text: $searchText,
                  prompt: searchByMovies ? Constants.Strings.searchPlaceholderMovie : Constants.Strings.searchPlaceholderTV)
    }
  }
}

#Preview {
  SearchView()
}
