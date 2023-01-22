//
//  MenuItemsOptionView.swift
//  LittleLemonDinnerMenu
//
//  Created by Jevgeni Vakker on 15.01.2023.
//

import SwiftUI

struct MenuItemsOptionView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    var body: some View {
        NavigationStack {
            List {
                // Toggle was chosen for its ability to select multiple items because the user may want to select, for example, drinks and food or select all items. A single selection would only allow one item to be selected and would require the addition of a select all option.
                Section("Selected categories") {
                    Toggle(MenuCategory.food.rawValue, isOn: $viewModel.isShowFood)
                    Toggle(MenuCategory.drink.rawValue, isOn: $viewModel.isShowDrinks)
                    Toggle(MenuCategory.dessert.rawValue, isOn: $viewModel.isShowDesserts)
                }
                // Picker was chosen for its ability to select one item out of several.
                Picker("Sort by", selection: $viewModel.sortBy) {
                    ForEach(SortBy.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
            }
            .pickerStyle(.inline)
            .listStyle(.grouped)
        }
        .navigationTitle("Filter")
    }
}


struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionView().environmentObject(MenuViewViewModel())
    }
}
