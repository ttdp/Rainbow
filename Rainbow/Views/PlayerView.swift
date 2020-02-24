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
    
    @EnvironmentObject var player: Player
    
    let episodes = [Episode(title: "Breaking Bad"), Episode(title: "Better Call Saul")]
    
    var body: some View {
        List {
            Button(
                action: { self.player.isPlaying ? self.player.pause() : self.player.play() },
                label: { Text(player.isPlaying ? "Pause" : "Play") }
            )
            
            ForEach(episodes) { episode in
                Text(episode.title)
            }
        }
    }
    
}

struct PlayerView_Previews: PreviewProvider {
    
    static let player = Player()
    
    static var previews: some View {
        PlayerView()
    }
    
}
