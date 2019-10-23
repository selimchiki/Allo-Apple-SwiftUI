//
//  MenuTableView.swift
//  Allo-Apple-SwiftUI
//
//  Created by Sélim Chiki on 23/10/2019.
//  Copyright © 2019 Sélim Chiki. All rights reserved.
//

import SwiftUI

struct MenuTableView: View {
    
    var category: String
    
    var body: some View {
        List {
            Text("Hello World!")
            Text(category)
        }
    }
}

struct MenuTableView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTableView(category: "Entree")
    }
}
