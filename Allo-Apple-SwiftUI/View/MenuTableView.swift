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
    
    @State var menuItems = [MenuItem]()
    
    var body: some View {
        List(menuItems) { menuItem in
            NavigationLink(destination: MenuItemDetailView(menuItem: menuItem)) {
                Text(menuItem.name)
            }
        }.navigationBarTitle(self.category)
        .onAppear(perform: self.fetchMenuItem)
    }
    
    private func fetchMenuItem() {
        MenuController.shared.fetchMenuItems(forCategory: category) { (menuItems) in
            if let menuItems = menuItems {
                self.menuItems = menuItems
            }
        }
    }
}

struct MenuTableView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTableView(category: "Entree")
    }
}
