//
//  ContentView.swift
//  Allo-Apple-SwiftUI
//
//  Created by Sélim Chiki on 23/10/2019.
//  Copyright © 2019 Sélim Chiki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            CategoryTableView()
                .tag(0)
                .tabItem({
                    VStack {
                        Image(systemName: "bag.fill")
                        Text("Menu")
                    }
                })
            OrderView()
                .tag(1)
                .tabItem({
                    Image(systemName: "cart.fill")
                    
                    Text("Your Order")
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
