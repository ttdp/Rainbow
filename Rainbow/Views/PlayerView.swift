//
//  PlayerView.swift
//  Rainbow
//
//  Created by Tian Tong on 2020/2/24.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI
import Combine

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
    @State var keyword = ""
    
    let episodes = [
        Episode(title: "Breaking Bad", image: "breaking_bad"),
        Episode(title: "Better Call Saul")
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
                TextField("Search...", text: $keyword)
                ForEach(episodes) { episode in
                    RainbowRow(episode: episode)
                }
                .frame(maxWidth: .infinity)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.blue, lineWidth: 4))
            }
            .onTapGesture(perform: dismissKeyboard)
        }
        .navigationBarTitle(Text("Episodes"))
        .onAppear(perform: subscribe)
    }
    
    @State var subscription: AnyCancellable?
    
    func subscribe() {
        let notification = UIApplication.keyboardDidShowNotification
        let publisher = NotificationCenter.default.publisher(for: notification)
            .map { (notification) -> CGFloat in
                guard let endFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
                    return 0.0
                }
                return endFrame.cgRectValue.height
        }
        
        subscription = publisher.sink(receiveCompletion: { _ in
            print("Completion")
        }, receiveValue: { height in
            print("Received keyboard height: \(height)")
        })
    }
    
}

struct PlayerView_Previews: PreviewProvider {
    
    static var previews: some View {
        PlayerView(player: Player())
    }
    
}
