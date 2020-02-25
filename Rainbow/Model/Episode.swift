//
//  Episode.swift
//  Rainbow
//
//  Created by Tian Tong on 2020/2/25.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI
import Foundation

enum MediaType {
    case text
    case image
    case link
}

struct Episode: Identifiable {
    
    let id = UUID()
    let title: String
    let image: String?
    let mediaType: MediaType
    
    init(title: String, image: String? = nil, mediaType: MediaType = .text) {
        self.title = title
        self.image = image
        self.mediaType = mediaType
    }
    
}


