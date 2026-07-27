//
//  UpcomingView.swift
//  SwiftFlix
//
//  Created by karmic on 7/27/26.
//

import SwiftUI

struct UpcomingView: View {
    var body: some View {
      VerticalListView(titles: Title.previewTitles)
    }
}

#Preview {
    UpcomingView()
}
