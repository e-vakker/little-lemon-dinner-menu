//
//  LittleLemonDinnerMenuTests.swift
//  LittleLemonDinnerMenuTests
//
//  Created by Jevgeni Vakker on 15.01.2023.
//

import XCTest
@testable import LittleLemonDinnerMenu

final class LittleLemonDinnerMenuTests: XCTestCase {
    let viewModel = MenuViewViewModel()
    
    func test_checkFoodTitle() {
        let foodTitle = viewModel.foods[0]
        XCTAssertEqual(foodTitle.title, "Food 4")
    }
    
    func test_checkIngredient() {
        let foodIngredient = viewModel.foods[0]
        XCTAssertEqual(foodIngredient.ingredient, [.tomatoSauce, .carrot, .pasta])
    }

}
