//
//  AutoScrollView.swift
//  Rainbow
//
//  Created by Tian Tong on 2020/2/28.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI

struct AutoScrollView: View {
    
    @State var count = 10
    @State var input = ""
    
    @State private var contentOffset: CGPoint = .zero
    
    var body: some View {
        VStack(alignment: .center) {
            List {
                ForEach(1 ... self.count, id: \.self) { number in
                    Text(String(number))
                }
                
            }
            
            TextField("Type something...", text: self.$input)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .border(Color.blue, width: 3)
        }
        .navigationBarTitle(Text("Auto Scroll"), displayMode: .inline)
        .navigationBarItems(trailing: Button("Add") {
            self.count += 1
        })
    }
    
}
