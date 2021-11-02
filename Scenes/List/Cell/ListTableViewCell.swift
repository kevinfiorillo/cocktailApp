//
//  ListTableViewCell.swift
//  cocktailApp
//
//  Created by kevin on 26/10/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var drinkName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell(with drink: List.FetchDrinks.ViewModel.DisplayedDrink){
        drinkName.text = drink.drinkName
    }
    
}
