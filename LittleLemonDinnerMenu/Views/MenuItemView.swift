//
//  MenuItemsView.swift
//  LittleLemonDinnerMenu
//
//  Created by Jevgeni Vakker on 15.01.2023.
//

import SwiftUI

struct MenuItemView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    init(menuItems: [MenuItem], menuCategory: MenuCategory) {
        self.menuItems = menuItems
        self.menuCategory = menuCategory
    }
    
    var menuItems: [MenuItem]
    
    var menuCategory: MenuCategory
    
    // Used in Lazy grid to create a 3 item wide grid
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            // Title
            HStack {
                Text(menuCategory.rawValue)
                    .font(.title)
                    .fontWeight(.medium)
                Spacer()
            }
            // Adding a grid with elements in the view
            LazyVGrid(columns: threeColumnGrid) {
                ForEach((menuItems), id: \.self) { menuItem in
                    // Transition and transfer of data to another view
                    NavigationLink(destination: MenuItemDetailsView(menuItem: menuItem)) {
                        // Card item with a potential food image (black square) and the name of the dish
                        VStack {
                            Rectangle()
                            Text(menuItem.title)
                        }
                        .frame(height: 120)
                        .foregroundColor(.black)
                    }
                }
            }
        }
        .padding()
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MenuViewViewModel()
        MenuItemView(menuItems: viewModel.foods, menuCategory: .food)
    }
}
