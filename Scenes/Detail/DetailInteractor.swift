

import Foundation

protocol DetailBusinessLogic {
    func fetchDrinkDetail(request: Detail.FetchDrink.Request)
    //func showGroupDetail(request: Detail.DisplaySelectedDrink.Request)
    func getDrinkImage(request: Detail.DrinkImage.Request)
}

protocol DetailDataStore {
    var drink: DrinkDetail! { get set }
    var idDetail: String? { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    var presenter: DetailPresentationLogic?
    var worker: DetailWorker = DetailWorker()
    var drink: DrinkDetail!
    var idDetail: String?
    
    // MARK: Methods
    
    func fetchDrinkDetail(request: Detail.FetchDrink.Request) {
        worker = DetailWorker()
        worker.getDrinkDetail(with: idDetail!, completion: { drinks in
            self.drink = drinks[0]
            //hasta aca
            let response = Detail.FetchDrink.Response(drink: drinks[0])
            self.presenter?.presentFetchedDrink(response: response)
        })
    }


    func getDrinkImage(request: Detail.DrinkImage.Request) {

        let url = URL(string: drink.image!)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            guard let imageData = data else {
                return
            }
            DispatchQueue.main.async {
                let response = Detail.DrinkImage.Response(imageData: imageData)
                self.presenter?.presentDrinkImage(response: response)
            }
        }
    }
}
