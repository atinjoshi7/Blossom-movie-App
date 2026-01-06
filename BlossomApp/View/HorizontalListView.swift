//
//  HorizontalListView.swift
//  BlossomApp
//
//  Created by Jarvis on 30/12/25.
//

import SwiftUI

struct HorizontalListView: View {
    
    let header: String
    //    let titles = [Constants.testTitleURL2, Constants.testTitleURL3, Constants.testTitleURL]
    var titles: [Title]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(header)
                .font(.title)
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(titles){
                        title in
                        NavigationLink {
                            TitleDetailView(title: title)
                        } label: {
                            AsyncImage(url: URL(string: title.posterPath ?? "")){
                                image in
                                image.resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 120, height: 200)
                        }
                    }
                }
            }
        }
        .frame(height: 250)
        .padding(10)
    }
}


