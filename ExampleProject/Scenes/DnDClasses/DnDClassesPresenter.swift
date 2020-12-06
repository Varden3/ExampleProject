//
//  DnDClassesPresenter.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation

class DnDClassesPresenter: BasePaginationPresenter<DnDClass, DefaultDnDClassesNavigator, DnDClassViewModel> {
    
    init(useCase: UseCaseImp<DnDResult<DnDClass>>, navigator: DefaultDnDClassesNavigator, viewController: BasePaginationViewPresenter) {
        super.init(useCase: useCase, useCaseType: .classes, viewController: viewController, navigator: navigator)
    }
}
