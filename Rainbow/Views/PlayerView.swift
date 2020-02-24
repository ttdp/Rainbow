//
//  PlayerView.swift
//  Rainbow
//
//  Created by Tian Tong on 2020/2/24.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI

struct Episode: Identifiable {
    let id = UUID()
    let title: String
    let image: String?
    
    init(title: String, image: String? = nil) {
        self.title = title
        self.image = image
    }
}

final class Player: ObservableObject {
    
    @Published private(set) var isPlaying: Bool = false
    
    func play() {
        isPlaying = true
    }
    
    func pause() {
        isPlaying = false
    }
    
}

struct PlayerView: View {
    
    @ObservedObject var player: Player
    
    let episodes = [
        Episode(title: "Breaking Bad", image: "breaking_bad"),
        Episode(title: "Breaking Bad")
    ]
    
    init(player: Player) {
        self.player = player
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 30) {
            Button(
                action: { self.player.isPlaying ? self.player.pause() : self.player.play() },
                label: { Text(player.isPlaying ? "Pause" : "Play") }
            )
            
            List {
                Text("--")
                ForEach(episodes) { episode in
                    RainbowRow(episode: episode)
                }
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.blue, lineWidth: 4)
                )
            }
        }
        .navigationBarTitle(Text("Episodes"))
    }
    
}

struct PlayerView_Previews: PreviewProvider {
    
    static var previews: some View {
        PlayerView(player: Player())
    }
    
}
