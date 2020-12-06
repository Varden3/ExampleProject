//
//  DnDClassesNavigator.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import UIKit

protocol DnDClassesNavigator: BaseNavigator {
    func toClasses()
}

class DefaultDnDClassesNavigator: DnDClassesNavigator {
    private let storyboard: UIStoryboard
    private let navigationController: UINavigationController
    private let services: UseCaseProvider
    private let navigatorProvider: NavigatorProvider

    init(services: UseCaseProvider, navigatorProvider: NavigatorProvider,
         navigationController: UINavigationController,
         storyboard: UIStoryboard) {
        self.services = services
        self.navigatorProvider = navigatorProvider
        self.navigationController = navigationController
        self.storyboard = storyboard
    }
    
    func toItem(_ item: Any) {
        if item is DnDClass {
            let dndClass = item as! DnDClass
            toDnDClassDetail(classId: dndClass.id)
        }
    }
    
    func toClasses() {
        navigatorProvider.navigationController = navigationController
        let vc = navigatorProvider.makeClasses()
        navigationController.pushViewController(vc, animated: true)
    }

    func toDnDClassDetail(classId: String) {
        navigatorProvider.navigationController = navigationController
        let vc = navigatorProvider.makeDnDClassDetail(classId: classId)
        navigationController.pushViewController(vc, animated: true)
    }
}
