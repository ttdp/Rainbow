//
//  RainbowRow.swift
//  Rainbow
//
//  Created by Tian Tong on 2020/2/24.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI

struct RainbowRow: View {
    
    let episode: Episode
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
//                Spacer()
                Text(episode.title)
//                Spacer()
            }
            if episode.image != nil {
                Image(episode.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .shadow(color: .green, radius: 2, x: 0, y: 1)
        .zIndex(10)
        .clipped()
        .padding()
    }
}

struct RainbowRow_Previews: PreviewProvider {
    static var previews: some View {
        RainbowRow(episode: Episode(title: "Breaking Bad", image: "breaking_bad"))
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
