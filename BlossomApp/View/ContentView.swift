//
//  ContentView.swift
//  BlossomApp
//
//  Created by Jarvis on 27/12/25.
//

// API KEY: 5860d321963f0ccda58dfb0db12f36b6
// API Read Access Token :eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ODYwZDMyMTk2M2YwY2NkYTU4ZGZiMGRiMTJmMzZiNiIsIm5iZiI6MTc2Njg1NzQ4Mi41MDQsInN1YiI6IjY5NTAxYjBhMGZiN2UyYjVlM2IxY2E3YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.D-_qTNSed4348VnLihFm67DIA3UuqTm90-1OeewG-J4
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab(Constants.homeString,systemImage: Constants.homeIconString){
                HomeView()
            }
            Tab(Constants.upcomingString,systemImage: Constants.upcomingIconString){
                Text(Constants.upcomingString)
            }
            Tab(Constants.searchString,systemImage: Constants.searchIconString){
                Text(Constants.upcomingString)
            }
            Tab(Constants.downloadString,systemImage: Constants.downIconString){
                Text(Constants.downloadString)
            }
        }.onAppear{
            if let config = APIConfig.shared{
                print(config.tmdbAPIKey)
                print(config.tmdbBaseURL)
            
            }
            let titles = APIObject()
            print(titles.results)
        }
    }
}


//#Preview {
//    ContentView()
//}
