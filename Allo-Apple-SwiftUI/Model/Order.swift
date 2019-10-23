//
//  Order.swift
//  Allo-Apple-SwiftUI
//
//  Created by Sélim Chiki on 23/10/2019.
//  Copyright © 2019 Sélim Chiki. All rights reserved.
//

import Foundation

struct Order: Codable {
    
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
