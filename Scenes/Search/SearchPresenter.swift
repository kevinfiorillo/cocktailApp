//
//  SearchPresenter.swift
//  cocktailApp
//
//  Created by kevin on 21/10/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
    func presentCategories()
}

class SearchPresenter: SearchPresentationLogic {
    weak var viewController: SearchDisplayLogic?
    
    private let ListOfCategories: [String] = ["Cocktail","Ordinary Drink","Homemade Liqueur","Beer","Soft Drink / Soda"]

    // MARK: Present List of Categories

    func presentCategories(){
        var displayedCategories:[Search.ByCategory.ViewModel.DisplayedCategory] = []
        for category in ListOfCategories {
            let categoryViewModel = Search.ByCategory.ViewModel.DisplayedCategory(name: category)
            displayedCategories.append(categoryViewModel)
        }
        let viewModel = Search.ByCategory.ViewModel(displayedCategories: displayedCategories)
        viewController?.displayCategories(viewModel: viewModel)
        
    }
}
