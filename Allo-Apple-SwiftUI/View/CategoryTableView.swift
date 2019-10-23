//
//  CategoryTableView.swift
//  Allo-Apple-SwiftUI
//
//  Created by Sélim Chiki on 23/10/2019.
//  Copyright © 2019 Sélim Chiki. All rights reserved.
//

import SwiftUI

struct CategoryTableView: View {
    
    @State var categories = [String]()
    
    var body: some View {
        NavigationView {
            List(categories, id: \.self) { categorie in
                NavigationLink(destination: MenuTableView(category: categorie)) {
                    Text(categorie)
                }
            }.navigationBarTitle("Allo-Apple")
            .onAppear(perform: self.fetchCategories)
        }
    }
    
    private func fetchCategories() {
        MenuController.shared.fetchCategories { (categories) in
            if let categories = categories {
                self.categories = categories
            }
        }
    }
}

struct CategoryTableView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTableView()
    }
}
