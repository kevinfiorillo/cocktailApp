
import Foundation

// swiftlint:disable nesting
enum Detail {
    
    enum FetchDrink {
        struct Request {
        }
        struct Response {
            let drink: DrinkDetail
        }
        struct ViewModel {
            struct DisplayedDrink {
                var name: String
                var instructions: String
            }
            var displayDrink: DisplayedDrink?
        }
    }

//    enum DisplaySelectedDrink {
//        struct Request {
//        }
//        struct Response {
//            let drink: DrinkDetail
//        }
//        struct ViewModel {
//            struct DisplayedDrink {
//                let name: String
//                let instructions: String
//            }
//            var displayDrink: DisplayedDrink
//        }
//    }
//
    enum DrinkImage {
        struct Request {
        }
        struct Response {
            let imageData: Data
        }
        struct ViewModel {
            let imageData: Data
        }
    }
}

struct DrinkDetailData: Codable {
    let drinks: [DrinkDetail]
}

struct DrinkDetail: Codable {
    let name: String?
    let image: String?
    let id: String?
    let instructions: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    
    
    private enum CodingKeys: String, CodingKey{
        case    strIngredient1,
                strIngredient2,
                strIngredient3,
                strIngredient4,
                strIngredient5,
                strIngredient6,
                strMeasure1,
                strMeasure2,
                strMeasure3,
                strMeasure4,
                strMeasure5,
                strMeasure6
        case name = "strDrink"
        case image = "strDrinkThumb"
        case id = "idDrink"
        case instructions = "strInstructions"
    }
}
