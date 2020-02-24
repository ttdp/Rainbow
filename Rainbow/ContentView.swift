//
//  ContentView.swift
//  Rainbow
//
//  Created by Tian Tong on 2020/2/16.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            NavigationLink(destination: SecondaryView()) {
                Text("Hello, World!")
            }
            .navigationBarTitle("Hello")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
