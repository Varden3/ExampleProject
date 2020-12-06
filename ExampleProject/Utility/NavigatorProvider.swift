//
//  NavigatorProvider.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import UIKit

final class NavigatorProvider {
    
    private let services: UseCaseProvider
    public var navigationController: UINavigationController

    init(services: UseCaseProvider) {
        self.services = services
        self.navigationController = UINavigationController()
    }
    
    func makeTabs() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let classesNavigationController = UINavigationController()
        classesNavigationController.tabBarItem = UITabBarItem(title: "Classes".localized(),
                image: UIImage(named: "classes"),
                selectedImage: nil)
        let classesNavigator = DefaultDnDClassesNavigator(services: services, navigatorProvider: self,
        navigationController: classesNavigationController, storyboard: storyboard)
        
//        let monstersNavigationController = UINavigationController()
//        monstersNavigationController.tabBarItem = UITabBarItem(title: "Monsters".localized(),
//                                                              image: UIImage(named: "monsters"),
//                                                              selectedImage: nil)
//        let monstersNavigator = DefaultCharactersNavigator(services: services, navigatorProvider: self,
//                                                       navigationController: monstersNavigationController,
//                                                       storyboard: storyboard)

        let tabBarController = MainTabBarViewController()
        tabBarController.viewControllers = [
                classesNavigationController
        ]
        
        classesNavigator.toClasses()
//        monstersNavigator.toMonsters()
        
        let mainTabBarPresenter = MainTabBarPresenter(useCase: services.makeUseCase(), viewController: tabBarController)
        tabBarController.presenter = mainTabBarPresenter
        
        return tabBarController
    }
    
    func makeClasses() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigator = DefaultDnDClassesNavigator(services: services, navigatorProvider: self,
        navigationController: navigationController,
        storyboard: storyboard)
        let vc = storyboard.instantiateViewController(ofType: DnDClassesViewController.self)
        vc.viewModel = ReusableRxViewModel(useCase: services.makeUseCase(),
                                           navigator: navigator, useCaseType: .classes)
        //let presenter = DnDClassesPresenter(useCase: services.makeUseCase(), navigator: navigator, viewController: vc)
        //vc.presenter = presenter
        return vc
    }
    
//    func makeMonsters() -> UIViewController {
//        let storyboard = UIStoryboard(name: "DnDMonsters", bundle: nil)
//        let navigator = DefaultDnDMonstersNavigator(services: services, navigatorProvider: self,
//        navigationController: navigationController,
//        storyboard: storyboard)
//        let vc = storyboard.instantiateViewController(ofType: DnDMonstersViewController.self)
//               let presenter = DnDMonstersPresenter(useCase: services.makeUseCase(),
//                                             navigator: navigator, viewController: vc)
//        vc.presenter = presenter
//        return vc
//    }
    
    func makeDnDClassDetail(classId: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigator = DefaultDnDClassesNavigator(services: services, navigatorProvider: self,
        navigationController: navigationController,
        storyboard: storyboard)
        let vc = storyboard.instantiateViewController(ofType: DnDClassDetailViewController.self)
        vc.viewModel = DnDClassDetailViewModel(classId: classId, useCase: services.makeUseCase(), navigator: navigator)
        //let presenter = DnDClassDetailPresenter(navigator: navigator, viewController: vc, rows: rows, columns: columns)
        //vc.presenter = presenter
        return vc
    }
}
