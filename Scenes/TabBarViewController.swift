//
//  TabBarViewController.swift
//  cocktailApp
//
//  Created by kevin on 28/10/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewControllers()
    }
    

    private func buildViewControllers(){
        let listMoviesViewController = UINavigationController(rootViewController: SearchViewController(nibName: "SearchViewController", bundle: nil))
        listMoviesViewController.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "list.dash"), selectedImage: nil)
        let randomMovieViewController = UINavigationController(rootViewController: RandomViewController(nibName: "RandomViewController", bundle: nil))
        randomMovieViewController.tabBarItem = UITabBarItem(title: "Random", image: UIImage(systemName: "shuffle"), selectedImage: nil)
        viewControllers = [listMoviesViewController, randomMovieViewController]
    }

}
