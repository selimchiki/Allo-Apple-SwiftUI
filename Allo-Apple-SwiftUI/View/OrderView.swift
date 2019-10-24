//
//  OrderView.swift
//  Allo-Apple-SwiftUI
//
//  Created by Sélim Chiki on 24/10/2019.
//  Copyright © 2019 Sélim Chiki. All rights reserved.
//

import SwiftUI

struct OrderView: View {

    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List(order.menuItems) { item in
                Text(item.name)
            }
            .navigationBarTitle("Your Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
