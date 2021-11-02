

import UIKit

@objc protocol ListRoutingLogic {
    func routeToDetail()
}

protocol ListDataPassing {
    var dataStore: ListDataStore? { get }
}

class ListRouter: NSObject, ListRoutingLogic, ListDataPassing {
    
   
    
    weak var viewController: ListViewController?
    var dataStore: ListDataStore?

     //MARK: Routing
    
    func routeToDetail() {
        let destinationVC = DetailViewController()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        navigateToSomewhere(source: viewController!, destination: destinationVC)
    }

    //MARK: Passing data

    func passDataToSomewhere(source: ListDataStore, destination: inout DetailDataStore) {
        let selectedRow = viewController?.DrinksListTableView.indexPathForSelectedRow?.row
        destination.idDetail = source.drinks![selectedRow!].drinkId
    }

     //MARK: Navigation

    func navigateToSomewhere(source: ListViewController, destination: DetailViewController) {
        source.show(destination, sender: nil)
    }
}
