//
//  SearchModels.swift
//  cocktailApp
//
//  Created by kevin on 21/10/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import Foundation

enum Search {
    // MARK: Use cases

    enum ByCategory {
        struct Request {
            let category: String
        }
        struct Response {
            //let groups: [Group]
        }
        struct ViewModel {
            struct DisplayedCategory {
                let name: String
            }
            let displayedCategories: [DisplayedCategory]
        }
    }
}
