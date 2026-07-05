//
//  HomeView.swift
//  SwiftFlix
//
//  Created by karmic on 7/5/26.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    VStack {
      AsyncImage(url: URL(string: Constants.URLs.testTitle)) { image in
        image
          .resizable()
          .scaledToFit()
      } placeholder: {
        ProgressView()
      }
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
    }
  }
}

#Preview {
  HomeView()
}
