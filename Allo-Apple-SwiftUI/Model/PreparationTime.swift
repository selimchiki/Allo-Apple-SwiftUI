//
//  PreparationTime.swift
//  Allo-Apple-SwiftUI
//
//  Created by Sélim Chiki on 23/10/2019.
//  Copyright © 2019 Sélim Chiki. All rights reserved.
//

import Foundation

struct PreparationTime: Codable {
    
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
