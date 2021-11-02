

import UIKit

protocol ListPresentationLogic {
    func presentFetchedDrinks(response: List.FetchDrinks.Response)
}

class ListPresenter: ListPresentationLogic {
    weak var viewController: ListDisplayLogic?

    // MARK: Present Fetched Groups

    func presentFetchedDrinks(response: List.FetchDrinks.Response) {
        var displayedDrinks: [List.FetchDrinks.ViewModel.DisplayedDrink] = []
        for drink in response.drinks {
            let displayDrink = List.FetchDrinks.ViewModel.DisplayedDrink(
                drinkName: drink.drinkName ?? "no tiene nombre",
                drinkImage: drink.drinkImage!,
                drinkID: drink.drinkId!
            )
            displayedDrinks.append(displayDrink)
        }
        let viewModel = List.FetchDrinks.ViewModel(displayedDrinks: displayedDrinks)
        viewController?.displayDrinks(viewModel: viewModel)
    }
}
