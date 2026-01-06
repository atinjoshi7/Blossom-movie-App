//
//  ViewModel.swift
//  BlossomApp
//
//  Created by Jarvis on 02/01/26.
//

import Foundation

@Observable
class ViewModel{
    enum fetchStatus{
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    private(set) var homeStatus: fetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    
    var trendingMovies: [Title] = []
    var trendingTV: [Title] = []
    var nowPlayingMovies: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    
    var herotitle: Title?
    
    func getTitles() async{
        homeStatus = .fetching
        
        if trendingMovies.isEmpty {
            do{
                async let tMovies =  dataFetcher.fetchTitles(for: "movie", by: "trending")
                async let tTV = dataFetcher.fetchTitles(for: "tv", by: "trending")
                async let tRMovies = dataFetcher.fetchTitles(for: "movie", by: "top_rated")
                async let tRTV = dataFetcher.fetchTitles(for: "tv", by: "top_rated")
                
                trendingMovies = try await tMovies
                trendingTV = try await tTV
                topRatedMovies = try await tRMovies
                topRatedTV = try await tRTV
                
                if let title = trendingMovies.randomElement(){
                    herotitle = title
                }
                homeStatus = .success
            }catch{
                print(error)
                homeStatus = .failed(underlyingError: error)
            }
        }else{
            homeStatus = .success
        }
    }
    
}
