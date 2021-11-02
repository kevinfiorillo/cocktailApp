

import UIKit

protocol DetailPresentationLogic {
    //func presentGroup(response: Detail.DisplaySelectedDrink.Response)
    func presentDrinkImage(response: Detail.DrinkImage.Response)
    func presentFetchedDrink(response: Detail.FetchDrink.Response)
}

class DetailPresenter: DetailPresentationLogic {
    weak  var viewController: DetailDisplayLogic?

    // MARK: Methods

    
    func presentFetchedDrink(response: Detail.FetchDrink.Response){
        
        let displayedDrink = Detail.FetchDrink.ViewModel.DisplayedDrink(
            name: response.drink.name ?? "no tiene nombre",
            instructions: response.drink.instructions ?? "instrucciones"
        )

        
        let viewModel = Detail.FetchDrink.ViewModel(displayDrink: displayedDrink)
        viewController?.displayDrink(viewModel: viewModel)
    }

    func presentDrinkImage(response: Detail.DrinkImage.Response) {
        let viewModel = Detail.DrinkImage.ViewModel(imageData: response.imageData)
        viewController?.displayDrinkImage(viewModel: viewModel)
    }
}
