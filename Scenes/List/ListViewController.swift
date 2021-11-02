//
//  ListViewController.swift
//  cocktailApp
//
//  Created by kevin on 21/10/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

protocol ListDisplayLogic: AnyObject {
    func displayDrinks(viewModel: List.FetchDrinks.ViewModel)
}

class ListViewController: UIViewController, ListDisplayLogic {

    @IBOutlet weak var DrinksListTableView: UITableView!

    
    var interactor: ListBusinessLogic?
    var router: (NSObjectProtocol & ListRoutingLogic & ListDataPassing)?

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = ListInteractor()
        let presenter = ListPresenter()
        let router = ListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.DrinksListTableView.delegate = self
        self.DrinksListTableView.dataSource = self
        
        DrinksListTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
        
        goFetchDrinks()

    }

    var displayedDrinks: [List.FetchDrinks.ViewModel.DisplayedDrink] = []

   // MARK: Go Fetch Groups
   private func goFetchDrinks() {
    let request = List.FetchDrinks.Request()
       interactor?.fetchDrinks(request: request)
   }

   func displayDrinks(viewModel: List.FetchDrinks.ViewModel) {
    displayedDrinks = viewModel.displayedDrinks
       DispatchQueue.main.async {
        self.DrinksListTableView.reloadData()
       }
   }
    

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedDrinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DrinksListTableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
          
          let drink = self.displayedDrinks[indexPath.row]
          
        
          cell.fillCell(with: drink)

          return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let categoryChosen = displayedCategories[categoryPicker.selectedRow(inComponent: 0)]
//        let request = Search.ByCategory.Request(category: categoryChosen.name)
//        interactor?.fetchCategory(request: request)
        router?.routeToDetail()
    }
    
    
}
