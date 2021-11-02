//
//  DetailRandomViewController.swift
//  cocktailApp
//
//  Created by kevin on 28/10/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

class DetailRandomViewController: DetailViewController {
    

    private func goFetchDrinkDetail() {
        let request = Detail.FetchDrink.Request()
        interactor?.fetchDrinkDetail(request: request)
        print("sss")
    }
}
