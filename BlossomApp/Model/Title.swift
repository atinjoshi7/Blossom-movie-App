//
//  Title.swift
//  BlossomApp
//
//  Created by Jarvis on 31/12/25.
//

//adult": false,
//"backdrop_path": "/l8pwO23MCvqYumzozpxynCNfck1.jpg",
//"id": 967941,
//"title": "Wicked: For Good",
//"original_title": "Wicked: For Good",
//"overview": "As an angry mob rises against the Wicked Witch, Glinda and Elphaba will need to come together one final time. With their singular friendship now the fulcrum of their futures, they will need to truly see each other, with honesty and empathy, if they are to change themselves, and all of Oz, for good.",
//"poster_path": "/si9tolnefLSUKaqQEGz1bWArOaL.jpg",
//"media_type": "movie",
//"original_language": "en",
//"genre_ids": [
//14,
//12,
//10749
//],
//"popularity": 104.4136,
//"release_date": "2025-11-19",
//"video": false,
//"vote_average": 6.724,
//"vote_count": 521

import Foundation

struct APIObject: Codable{
    var results: [Title] = []
}
struct Title: Codable, Identifiable, Hashable{
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    
    static var previewTitles = [
        Title(id: 1, title: "BeetleJuice", name: "BeetleJuice", overview: "Movie baout beetleJuice", posterPath: Constants.testTitleURL),
        Title(id: 2, title: "F&F", name: "F&F", overview: "Movie about Racing car", posterPath: Constants.testTitleURL2),
        Title(id: 3, title: "Hero", name: "Hero", overview: "Movie about hero", posterPath: Constants.testTitleURL3)

    ]
}
