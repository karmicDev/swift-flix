//
//  Movie.swift
//  SwiftFlix
//
//  Created by karmic on 7/6/26.
//

import Foundation

struct APIObject: Decodable {
  var results: [Title] = []
}

struct Title: Decodable, Identifiable {
  var adult: Bool?
  var backdropPath: String?
  var id: Int?
  var title: String?
  var originalTitle: String?
  var overview: String?
  var posterPath: String?
  var mediaType: String?
  var originalLanguage: String?
  var genreIds: [Int] = []
  var popularity: Float?
  var release_date: String?
  var softcore: Bool?
  var video: Bool?
  var voteAverage: Float?
  var voteCount: Float?

  static var previewTitles = [
    Title(adult: false,
          backdropPath: "/2ngdvUiEKW8Q37ta8BBdydE2cuq.jpg",
          id: 287620,
          title: "Stuart Fails to Save the Universe",
          originalTitle: "Stuart Fails to Save the Universe",
          overview: "After accidentally creating a new multiverse, comic book store owner Stuart Bloom must locate a quantum-interference device to restore reality.",
          posterPath:  "/iQbTbwmLX5Nh1nlH21YUJPWt3Zo.jpg",
          mediaType:  "tv",
          originalLanguage:  "en",
          genreIds: [35, 10765],
          popularity:  9.9706,
          release_date:  "2026-07-23",
          softcore:  false,
          voteAverage:  8.7,
          voteCount:  3),
    Title(adult: false,
          backdropPath: "/flxau5Iu7bChQHsESqvGZ3FQRaI.jpg",
          id: 1275779,
          title: "Disclosure Day",
          originalTitle: "Disclosure Day",
          overview: "A cybersecurity expert becomes a whistleblower after uncovering secrets about aliens, putting him on the run from a corporation. Meanwhile, a meteorologist experiencing strange phenomena joins forces with him to prove there's life beyond our understanding.",
          posterPath:  "/AnJ8IQJI23hNpYXVNaythu061Ru.jpg",
          mediaType:  "movie",
          originalLanguage:  "en",
          genreIds: [878, 53],
          popularity:  574.4931,
          release_date:  "2026-06-10",
          softcore:  false,
          voteAverage:  7.7,
          voteCount:  1424),
    Title(adult: false,
          backdropPath: "/tYuC9kUwqhpDQ3pv1kLMqyMF1Jw.jpg",
          id: 1368337,
          title: "The Odyssey",
          originalTitle: "The Odyssey",
          overview: "Odysseus, the legendary King of Ithaca, embarks on a long and perilous journey home following the Trojan War. Throughout his voyage, he is forced to confront the whims of gods, mythological monsters, and trials that stretch both his cunning and his humanity to the breaking point.",
          posterPath:  "/5rhTDKUhPYvpdQIijFIs5VoWsON.jpg",
          mediaType:  "movie",
          originalLanguage:  "en",
          genreIds: [12, 28, 14],
          popularity:  994.263,
          release_date:  "2026-07-15",
          softcore:  false,
          voteAverage:  7.946,
          voteCount:  1197)
  ]
}
