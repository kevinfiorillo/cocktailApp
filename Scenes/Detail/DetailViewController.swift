//
//  DetailViewController.swift
//  cocktailApp
//
//  Created by kevin on 28/10/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

protocol DetailDisplayLogic: AnyObject {
    //func displayGroup(viewModel: Detail.DisplaySelectedDrink.ViewModel)
    func displayDrinkImage(viewModel: Detail.DrinkImage.ViewModel)
    func displayDrink(viewModel: Detail.FetchDrink.ViewModel)
}

class DetailViewController: UIViewController, DetailDisplayLogic {
    
    
    
    var interactor: DetailBusinessLogic?
    var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?

    @IBOutlet weak var imageDetail: UIImageView!
    
    @IBOutlet weak var nameDetailLabel: UILabel!
    
    @IBOutlet weak var instructions: UILabel!
    
    


    // MARK: Object lifecycle

    override  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }



    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        goFetchDrinkDetail()
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
////        showGroupDetail()
////        getGroupImage()
//        goFetchDrinkDetail()
//
//    }

    // MARK: Methods
    
    private func goFetchDrinkDetail() {
        let request = Detail.FetchDrink.Request()
        interactor?.fetchDrinkDetail(request: request)
    }
    
    func displayDrink(viewModel: Detail.FetchDrink.ViewModel) {
        nameDetailLabel.text = viewModel.displayDrink?.name
        instructions.text = viewModel.displayDrink?.instructions
        getDrinkImage()
    }


    private func getDrinkImage() {
        let request = Detail.DrinkImage.Request()
        interactor?.getDrinkImage(request: request)
    }


    func displayDrinkImage(viewModel: Detail.DrinkImage.ViewModel) {
        self.imageDetail.image = UIImage(data: viewModel.imageData)
        
    }

}
