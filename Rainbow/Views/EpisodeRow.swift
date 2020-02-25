//
//  EpisodeRow.swift
//  Rainbow
//
//  Created by Tian Tong on 2020/2/24.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI

struct EpisodeTextRow: View {
    
    let episode: Episode
    let index: Int
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text(episode.title)
                Spacer()
            }
        }
        .shadow(color: .green, radius: 2, x: 0, y: 1)
        .zIndex(10)
        .clipped()
        .padding()
        .onTapGesture(perform: tapEvent)
    }
    
    private func tapEvent() {
        print(index)
    }
}

struct EpisodeImageRow: View {
    
    let episode: Episode
    let index: Int
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text(episode.title)
                Spacer()
            }
            .shadow(color: .green, radius: 2, x: 0, y: 1)
            .zIndex(10)
            .clipped()
            .padding([.leading, .top, .trailing])
            
            Image(episode.image!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding([.leading, .bottom, .trailing])
        }
        .onTapGesture(perform: tapEvent)
    }
    
    private func tapEvent() {
        print(index)
    }
}

struct EpisodeLinkRow: View {
    
    let episode: Episode
    let index: Int
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text(episode.title)
                    .underline()
                Spacer()
            }
            .shadow(color: .green, radius: 2, x: 0, y: 1)
            .zIndex(10)
            .padding()
        }
        .onTapGesture(perform: tapEvent)
    }
    
    private func tapEvent() {
        print(index)
    }
}


struct EpisodeRow_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            EpisodeTextRow(episode: Episode(title: "Breaking Bad", image: "breaking_bad"), index: 0)
                .previewLayout(.fixed(width: 300, height: 100))
            
            EpisodeImageRow(episode: Episode(title: "Breaking Bad", image: "breaking_bad"), index: 1)
                .previewLayout(.fixed(width: 300, height: 200))
        }
    }
    
}
