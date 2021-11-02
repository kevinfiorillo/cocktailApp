//
//  SearchViewController.swift
//  cocktailApp
//
//  Created by kevin on 21/10/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

protocol SearchDisplayLogic: AnyObject {
    func displayCategories(viewModel: Search.ByCategory.ViewModel)
}

class SearchViewController: UIViewController, SearchDisplayLogic {

    

    
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    var displayedCategories: [Search.ByCategory.ViewModel.DisplayedCategory] = []
    
    var interactor: SearchBusinessLogic?
    var router: (NSObjectProtocol & SearchRoutingLogic & SearchDataPassing)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        //change UIPickerView color
        categoryPicker.setValue(UIColor.white, forKey: "textColor")
        
        setup()
        
        goFillPicker()
        
        
        
    }

    
    private func setup(){
        let viewController = self
               let interactor = SearchInteractor()
               let presenter = SearchPresenter()
               let router = SearchRouter()
               viewController.interactor = interactor
               viewController.router = router
               interactor.presenter = presenter
               presenter.viewController = viewController
               router.viewController = viewController
               router.dataStore = interactor
    }
    
    private func goFillPicker(){
        interactor?.askForCategories()
    }
    
    
    @IBAction func searchPressed(_ sender: Any) {
        let categoryChosen = displayedCategories[categoryPicker.selectedRow(inComponent: 0)]
        let request = Search.ByCategory.Request(category: categoryChosen.name)
        interactor?.fetchCategory(request: request)
        router?.routeToList()
        
    }
    
    
    func displayCategories(viewModel: Search.ByCategory.ViewModel) {
        self.displayedCategories = viewModel.displayedCategories
    }
    


}

extension SearchViewController: UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return displayedCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.displayedCategories[row].name
    }
    

    
    
}
