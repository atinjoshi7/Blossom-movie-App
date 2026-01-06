//
//  Constants.swift
//  BlossomApp
//
//  Created by Jarvis on 27/12/25.
//

import Foundation
import SwiftUI

struct Constants{
    static let homeString = "Home"
    static let upcomingString = "Upcoming"
    static let searchString = "Search"
    static let downloadString = "Download"
    static let playString = "Play"
    static let trendingMovieString = "Trending Movies"
    static let trendingTVString = "Trending TV"
    static let topRatedMovieString = "Top Rated Movies"
    static let topRatedTVString = "Top Rated TV"
    
    static let homeIconString = "house"
    static let upcomingIconString = "play.circle"
    static let searchIconString = "magnifyingglass"
    static let downIconString = "arrow.down.to.line"
    
    static let testTitleURL = "https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg"
    static let testTitleURL2 = "https://image.tmdb.org/t/p/w500/wwemzKWzjKYJFfCeiB57q3r4Bcm.png"
    static let testTitleURL3 = "https://image.tmdb.org/t/p/w500/9Rj8l6gElLpRL7Kj17iZhrT5Zuw.jpg"
    static let testTitleURL4 = "https://image.tmdb.org/t/p/w500/zEqC4HGQ2lItd6thJ4wqa0uRbP8.jpg"

    static let posterURLStart = "https://image.tmdb.org/t/p/w500"
       
       static func addPosterPath(to titles: inout[Title]) {
           for index in titles.indices {
               if let path = titles[index].posterPath {
                   titles[index].posterPath = Constants.posterURLStart + path
               }
           }
       }
}

extension Text{
    func ghostButton() -> some View {
        self
            .frame(width:100,height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .background{
                RoundedRectangle(cornerRadius:20,style: .continuous)
                    .stroke(.buttonBorder,lineWidth: 5)
            }
    }
}

extension Image{
    func ghostImage() -> some View{
        self
            .resizable()
                .scaledToFit()
    }
}
