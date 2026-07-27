//
//  SearchView.swift
//  SwiftFlix
//
//  Created by karmic on 7/27/26.
//

import SwiftUI

struct SearchView: View {
  @State private var searchByMovies = true
  @State private var searchText = ""
  private let searchViewModel = SearchViewModel()
  
  var body: some View {
    NavigationStack {
      ScrollView {
        if let error = searchViewModel.errorMessage {
            Text(error)
            .foregroundColor(.red)
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 10))
        }
        
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
          ForEach(searchViewModel.searchTitles) { title in
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
            
            Task {
              await searchViewModel.getSearchTitles(for: searchText)
            }
            
          } label: {
            Image(systemName: searchByMovies ? Constants.Icons.movie : Constants.Icons.tv)
          }
        }
      }
      .searchable(text: $searchText,
                  prompt: searchByMovies ? Constants.Strings.searchPlaceholderMovie : Constants.Strings.searchPlaceholderTV)
      .task(id: searchText) {
        try? await Task.sleep(for: .milliseconds(500))
        
        if Task.isCancelled {
          return
        }
        await searchViewModel.getSearchTitles(for: searchText)
      }
    }
  }
}

#Preview {
  SearchView()
}
