//
//  SearchRouter.swift
//  cocktailApp
//
//  Created by kevin on 21/10/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

protocol SearchRoutingLogic {
    func routeToList()
}

protocol SearchDataPassing {
    var dataStore: SearchDataStore? { get }
}

class SearchRouter: NSObject, SearchRoutingLogic, SearchDataPassing {
    weak var viewController: SearchViewController?
    var dataStore: SearchDataStore?


    func routeToList() {
        let destinationVC = ListViewController()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore, destination: &destinationDS)
        navigateToSomewhere(source: viewController, destination: destinationVC)
    }

    // MARK: Passing data

    func passDataToSomewhere(source: SearchDataStore?, destination: inout ListDataStore) {
        destination.category = source?.category
    }

    // MARK: Navigation

    func navigateToSomewhere(source: SearchViewController?, destination: ListViewController) {
        source?.show(destination, sender: nil)
    }
}
