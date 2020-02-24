//
//  ContentView.swift
//  Rainbow
//
//  Created by Tian Tong on 2020/2/16.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI

struct Pokemon: Identifiable {
    let id: Int
    let name: String
    let type: String
    let color: Color
}

struct ContentView: View {
    
    @State var pokemonList = [
        Pokemon(id: 0, name: "Charmander", type: "Fire", color: .red),
        Pokemon(id: 1, name: "Squirtle", type: "Water", color: .blue),
        Pokemon(id: 2, name: "Bulbasaur", type: "Grass", color: .green),
        Pokemon(id: 3, name: "Pikachu", type: "Electric", color: .yellow)
    ]
    @State var showDetails = true
    
    @ObservedObject var player: Player
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .center, spacing: 30) {
                Button(
                    action: { self.player.isPlaying ? self.player.pause() : self.player.play() },
                    label: { Text(player.isPlaying ? "Pause" : "Play") }
                )
                
                NavigationLink(destination: PlayerView(player: player)) {
                    Text("All Episodes")
                }
                
                List(pokemonList) { pokemon in
                    HStack {
                        Text(pokemon.name)
                        if self.showDetails {
                            Text(pokemon.type)
                                .foregroundColor(pokemon.color)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Pokemon"))
            .navigationBarItems(
                leading: ToggleTextButton(isOn: $showDetails),
                
                trailing: Button(
                    action: addPokemon,
                    label: { Text("Add") }
                )
            )
        }
    }
    
    func addPokemon() {
        if let randomPokemon = pokemonList.randomElement() {
            pokemonList.append(randomPokemon)
        }
    }
    
}

struct ToggleTextButton: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        Button(
            action: { self.isOn.toggle() },
            label: { Text(self.isOn ? "Hide" : "Show") }
        )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(player: Player())
    }
    
}
