//
//  HomeView.swift
//  BlossomApp
//
//  Created by Jarvis on 27/12/25.
//

import SwiftUI

struct HomeView: View {
//    var heroTitle = Constants.testTitleURL
    
    let viewModel = ViewModel()
     
    
    var body: some View {
        NavigationStack {
            
            GeometryReader { geo in
                ScrollView{
                    switch viewModel.homeStatus{
                    case .notStarted:
                        EmptyView()
                    case .fetching:
                        ProgressView()
                            .frame(width: geo.size.width, height: geo.size.height)
                    case .success:
                        LazyVStack{
                            AsyncImage(url: URL(string: viewModel.herotitle?.posterPath ?? "")){ image in
                                image.resizable()
                                    .scaledToFit()
                                    .overlay{
                                        LinearGradient(
                                            stops: [
                                                Gradient.Stop(color: .clear, location: 0.8),
                                                Gradient.Stop(color: .gradient, location: 1)],
                                            startPoint: .top,
                                            endPoint: .bottom ,
                                        )
                                    }
                            } placeholder: {
                                ProgressView()
                            }
                            
                            HStack(spacing: 25){
                                NavigationLink {
                                    TitleDetailView(title: viewModel.herotitle!)
                                } label: {
                                    Text(Constants.playString)
                                        .ghostButton()
                                }
                                NavigationLink {
                                    TitleDetailView(title: viewModel.herotitle!)
                                } label: {
                                    Text(Constants.downloadString)
                                        .ghostButton()
                                }
                            
                            }
                            HorizontalListView(header: Constants.trendingMovieString, titles:viewModel.trendingMovies)
                            HorizontalListView(header:Constants.trendingTVString, titles: viewModel.trendingTV)
                            HorizontalListView(header:Constants.topRatedMovieString, titles: viewModel.topRatedMovies)
                            HorizontalListView(header: Constants.topRatedTVString, titles: viewModel.topRatedTV)
                        }
                    case .failed(let error):
                        Text("Error: \(error)")
                    }
                }
                .task{
                    await viewModel.getTitles()
                }
            }
        }
    }
}
