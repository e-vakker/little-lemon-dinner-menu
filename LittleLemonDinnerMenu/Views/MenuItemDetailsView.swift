//
//  MenuItemDetailsView.swift
//  LittleLemonDinnerMenu
//
//  Created by Jevgeni Vakker on 15.01.2023.
//

import SwiftUI

struct MenuItemDetailsView: View {
    
    var menuItem: MenuItem
    
    var body: some View {
        NavigationStack {
            // Potential picture of the dish
            Image("Little Lemon logo")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
            // Show detailed information if item is higher than 0
            if menuItem.price > 0 {
                VStack {
                    Text("Price:")
                        .fontWeight(.bold)
                    // Convert double to text to 0.00 format
                    Text(String(format: "%.2f", menuItem.price))
                }
                .padding(1)
            }
            if menuItem.ordersCount > 0 {
                VStack {
                    Text("Ordered:")
                        .fontWeight(.bold)
                    Text("\(menuItem.ordersCount)")
                }
                .padding(1)
            }
            if menuItem.ingredient.count > 0 {
                VStack {
                    Text("Ingredients:")
                        .fontWeight(.bold)
                    ForEach(menuItem.ingredient, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .padding(1)
            }
            
        }
        .navigationTitle(menuItem.title)
        .padding([.leading, .trailing], 60)
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let menuItem = MenuItem(price: 10, title: "Food 1", menuCategory: .food, ordersCount: 15, ingredient: [.tomatoSauce])
        MenuItemDetailsView(menuItem: menuItem)
    }
}
