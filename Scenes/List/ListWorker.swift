


import Alamofire
import UIKit

class ListWorker {
   
    let drinksByCategoryURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c="


    
    func getDrinks(byCategory: String, completion: @escaping ([Drink]) -> ()){
        let category = byCategory.replacingOccurrences(of: " ", with: "_")
        let fullDrinksByCategoryURL = drinksByCategoryURL + category
        let request = AF.request(fullDrinksByCategoryURL,method: HTTPMethod.get)
        
        request.responseJSON{ (data) in
            do {
                let drinksJSON = try JSONDecoder().decode(DrinksData.self, from: data.data!)
                completion(drinksJSON.drinks)
            } catch {
                print(error)
            }
        }
    }
}
