//
//  TitleDetailView.swift
//  BlossomApp
//
//  Created by Jarvis on 03/01/26.
//

import SwiftUI

struct TitleDetailView: View {
    
    let title: Title
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                LazyVStack(alignment: .leading){
                    AsyncImage(url: URL(string: title.posterPath ?? "" )){ image in
                        image
                            .resizable()
                            .scaledToFit()
                    }placeholder:{
                        ProgressView()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.85)
                    
                    Text( (title.name ?? title.title) ?? "")
                        .bold()
                        .font(.title)
//                        .padding(5)
                
                        
                    
                    Text( title.overview ?? "" )
                        .padding(5)
                }
            }
        }
    }
}
