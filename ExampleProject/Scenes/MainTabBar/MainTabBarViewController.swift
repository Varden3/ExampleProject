//
//  MainTabBarViewController.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import UIKit

protocol MainTabBarViewPresenter {
    
}

class MainTabBarViewController: UITabBarController, MainTabBarViewPresenter {

    var presenter: MainTabBarPresenterView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
