//
//  Order.swift
//  Allo-Apple-SwiftUI
//
//  Created by Sélim Chiki on 23/10/2019.
//  Copyright © 2019 Sélim Chiki. All rights reserved.
//

import Foundation

class Order: ObservableObject {
    
    @Published var menuItems: [MenuItem]
    
    var total: Double {
        self.menuItems.reduce(0.0) { (result, menuItem) -> Double in
            return result + menuItem.price
        }
    }
    
    var preparationTime: Int {
        let menuIds = self.menuItems.map { $0.id }
        var min = 0
        MenuController.shared.submitOrder(forMenuIDs: menuIds) { (minutes) in
            guard let minutes = minutes else { return }
            min = minutes
        }
        return min
    }
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
    
}
