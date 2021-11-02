//
//  SearchInteractor.swift
//  cocktailApp
//
//  Created by kevin on 21/10/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
    func fetchCategory(request: Search.ByCategory.Request)
    func askForCategories()
}

protocol SearchDataStore {
    var category: String? { get set }
}

class SearchInteractor: SearchBusinessLogic, SearchDataStore {
    var presenter: SearchPresentationLogic?
    //var worker: SearchWorker?

    var category: String?

    // MARK: Fetch Groups

    func fetchCategory(request: Search.ByCategory.Request) {
        
        
        self.category = request.category

//        let response = List.FetchGroups.Response(groups: groups)
//        self.presenter?.presentFetchedGroups(response: response)
        
    }
    
    func askForCategories(){
        presenter?.presentCategories()
    }
}

