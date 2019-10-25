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
    
    @State var alert = false
    @State var acceptSubmit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(order.menuItems) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(String(format: "$%.2F", item.price))
                            .font(.footnote)
                    }
                }
                .onDelete(perform: delete)
                HStack {
                    Spacer()
                    order.menuItems.isEmpty ? Text("") : Text("Total: " + String(format: "$%.2f", order.total))
                        .font(.headline)
                        .fontWeight(.medium)
                    Spacer()
                }
                
            }
            .navigationBarTitle("Your Order")
            .navigationBarItems(leading: EditButton(), trailing: order.menuItems.isEmpty ? nil : Button(action: {
                    self.alert = true
                }, label: {
                    Text("Submit Order")
                })
                .alert(isPresented: $alert) {
                    Alert(title: Text("Confirm Order"), message: Text("You are about to submit your order with a total of \(String(format: "$%.2f", order.total))"), primaryButton: .default(Text("Submit"), action: {
                            self.acceptSubmit = true
                        }), secondaryButton: .cancel(Text("Cancel"))
                    )
                }
                .sheet(isPresented: $acceptSubmit) {
                    PreparationTimeView(order: self.order)
                }
            )
        }
    }
    
    private func delete(at offsets: IndexSet) {
        order.menuItems.remove(atOffsets: offsets)
    }
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
