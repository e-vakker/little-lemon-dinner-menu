//
//  MainView.swift
//  LittleLemonDinnerMenu
//
//  Created by Jevgeni Vakker on 18.01.2023.
//

import SwiftUI

struct MenuItemsView: View {
    // State object to hold the view model
    @StateObject private var viewModel = MenuViewViewModel()
    
    var body: some View {
        NavigationStack {
            // If the user has selected to show drinks, food or desserts in the filter, the MenuItemView for drinks will display items with example data.
            // environmentObject allows you to immediately update this view after changing any used data
            ScrollView {
                if viewModel.isShowFood {
                    MenuItemView(menuItems: viewModel.foods, menuCategory: .food).environmentObject(viewModel)
                }
                if viewModel.isShowDrinks {
                    MenuItemView(menuItems: viewModel.drinks, menuCategory: .drink).environmentObject(viewModel)
                }
                if viewModel.isShowDesserts {
                    MenuItemView(menuItems: viewModel.desserts, menuCategory: .dessert).environmentObject(viewModel)
                }
            }
            // The default sorting of the sample data takes place immediately before the view appears. In this case the arrays are sorted alphabetically.
            .onAppear() {
                viewModel.updateMenuItems()
            }
            .navigationTitle("Menu")
            .toolbar {
                Button(action: {
                    viewModel.isOpenedOptionView.toggle()
                }, label: {
                    Image(systemName: "slider.vertical.3")
                })
            }
            // Opens an OptionView with the option to filter data
            .sheet(isPresented: $viewModel.isOpenedOptionView) {
                NavigationStack {
                    MenuItemsOptionView().environmentObject(viewModel)
                        .toolbar {
                            // When the button is pressed, it sorts the data according to the user's choice
                            Button("Done") {
                                viewModel.updateMenuItems()
                                viewModel.isOpenedOptionView.toggle()
                            }
                        }
                }
            }
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
