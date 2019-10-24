//
//  PreparationTimeView.swift
//  Allo-Apple-SwiftUI
//
//  Created by Sélim Chiki on 24/10/2019.
//  Copyright © 2019 Sélim Chiki. All rights reserved.
//

import SwiftUI

struct PreparationTimeView: View {
    
    @ObservedObject var order: Order
    
    @State var minutes = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Thanks you for your order!Your wait time is approximaly \(self.minutes) minutes.")
            Button(action: {
                self.resetOrder()
            }, label: {
                Text("Go Back")
            })
        }
        .onAppear(perform: self.fetchPreparationTime)
    }
    
    private func resetOrder() {
        order.menuItems.removeAll()
    }
    
    private func fetchPreparationTime() {
        let menuIds = order.menuItems.map { $0.id }
        
        MenuController.shared.submitOrder(forMenuIDs: menuIds) { (minutes) in
            if let minutes = minutes {
                self.minutes = minutes
            }
        }
    }
}

struct PreparationTimeView_Previews: PreviewProvider {
    static var previews: some View {
        PreparationTimeView(order: Order())
    }
}
