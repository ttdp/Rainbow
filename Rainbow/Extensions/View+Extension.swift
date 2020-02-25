//
//  View+Extension.swift
//  Rainbow
//
//  Created by Tian Tong on 2020/2/25.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI

extension View {
    
    func dismissKeyboard() {
        UIApplication.shared.windows.forEach { $0.endEditing(true)}
    }
    
}
