//
//  EpisodeView.swift
//  Rainbow
//
//  Created by Tian Tong on 2020/2/24.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI
import Combine

struct EpisodeView: View {
    
    @ObservedObject var store = Store()
    @ObservedObject var player: Player
    @State var keyword = ""
    
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
                    
                ForEach(0 ..< store.episodes.count) { index in
                    self.buildView(at: index)
                }
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 2))
                
            }
            .onTapGesture(perform: dismissKeyboard)
        }
        .navigationBarTitle(Text("Episodes"))
        .onAppear(perform: subscribe)
    }
    
    private func buildView(at index: Int) -> AnyView {
        let episode = store.episodes[index]
        switch episode.mediaType {
        case .text:
            return AnyView(EpisodeTextRow(episode: episode, index: index))
        case .image:
            return AnyView(EpisodeImageRow(episode: episode, index: index))
        case .link:
            return AnyView(EpisodeLinkRow(episode: episode, index: index))
        }
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

final class Player: ObservableObject {
    
    @Published private(set) var isPlaying: Bool = false
    
    func play() {
        isPlaying = true
    }
    
    func pause() {
        isPlaying = false
    }
    
}

struct EpisodeView_Previews: PreviewProvider {
    
    static var previews: some View {
        EpisodeView(player: Player())
    }
    
}
