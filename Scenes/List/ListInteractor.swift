

import UIKit

protocol ListBusinessLogic {
    func fetchDrinks(request: List.FetchDrinks.Request)
}

protocol ListDataStore {
    var category: String? { get set }
    var drinks: [Drink]? { get set }
}

class ListInteractor: ListBusinessLogic, ListDataStore {
    var presenter: ListPresentationLogic?
    var worker: ListWorker?
    
    var category: String?

    var drinks: [Drink]?

    // MARK: Fetch Groups

    func fetchDrinks(request: List.FetchDrinks.Request) {
        worker = ListWorker()
        worker?.getDrinks(byCategory: category!, completion: { drinks in
            self.drinks = drinks

            let response = List.FetchDrinks.Response(drinks: drinks)
            self.presenter?.presentFetchedDrinks(response: response)
        })
    }
    

}
