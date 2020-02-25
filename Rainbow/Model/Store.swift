//
//  Store.swift
//  Rainbow
//
//  Created by Tian Tong on 2020/2/25.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation
import Combine

class Store: ObservableObject {
    
    @Published var episodes = [
        Episode(title: "Breaking Bad", image: "breaking_bad", mediaType: .image),
        Episode(title: "Better Call Saul"),
        Episode(title: "Home Land Season 8", mediaType: .link)
    ]
    
}
