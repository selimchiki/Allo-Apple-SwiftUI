//
//  MenuItemDetailView.swift
//  Allo-Apple-SwiftUI
//
//  Created by Sélim Chiki on 23/10/2019.
//  Copyright © 2019 Sélim Chiki. All rights reserved.
//

import SwiftUI

struct MenuItemDetailView: View {
    
    var menuItem: MenuItem
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage())
                .resizable()
                .scaledToFit()
            HStack {
                VStack {
                    Text(menuItem.name)
                        .font(.title)
                    Text(menuItem.detailText)
                        .font(.body)
                }
                Spacer()
                Text(String(format: "$%.2f", menuItem.price))
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            Spacer()
            Button(action: {
                print("Menu Item add to order")
            }, label: {
                Text("Add To Order")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            })
                .padding(10)
                .padding(.horizontal, 100)
                .background(Color.blue)
                .cornerRadius(25.0)
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                
        }.padding()
    }
}

struct MenuItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailView(menuItem: MenuItem(id: 1, name: "Spaghetti", detailText: "Spaghetti Bolo", price: 15.0, category: "entrees", imageURL: URL(string: "http://www.apple.com")!))
    }
}
