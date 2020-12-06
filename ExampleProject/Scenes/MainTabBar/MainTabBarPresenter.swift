//
//  MainTabBarPresenter.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation

protocol MainTabBarPresenterView {

}

class MainTabBarPresenter: MainTabBarPresenterView {
  
    private let useCase: UseCaseImp<String>
    
    var viewController: MainTabBarViewPresenter
        
    init(useCase: UseCaseImp<String>, viewController: MainTabBarViewPresenter) {
        self.useCase = useCase
        self.viewController = viewController
    }
}
