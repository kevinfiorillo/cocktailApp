

import Foundation
import Alamofire

class DetailWorker {


    
    let drinkDetailURL = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
    
    
    func getDrinkDetail(with id: String, completion: @escaping ([DrinkDetail]) -> ()){
     
        let fullDrinkDetailURL = drinkDetailURL + id
        let request = AF.request(fullDrinkDetailURL, method: HTTPMethod.get)
        
        request.responseJSON{ (data) in
            do {
                let drinkJSON = try JSONDecoder().decode(DrinkDetailData.self, from: data.data!)
                completion(drinkJSON.drinks)
            } catch {
                print(error)
            }
        }
    }

}
