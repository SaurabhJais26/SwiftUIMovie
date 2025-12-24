//
//  HomeView.swift
//  SwiftUIMovie
//
//  Created by AstroSage on 24/12/25.
//

import SwiftUI

struct HomeView: View {
    
    var heroTestTitle = Constants.testTitleURL
    
    var body: some View {
        AsyncImage(url: URL(string: heroTestTitle)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        
        HStack {
            Button {
                
            } label: {
                Text(Constants.playString)
                    .ghostButton()
            }
            
            Button {
                
            } label: {
                Text(Constants.downloadString)
                    .ghostButton()
            }
        }
    }
}

#Preview {
    HomeView()
}
