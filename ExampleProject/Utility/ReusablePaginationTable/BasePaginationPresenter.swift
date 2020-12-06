//
//  BasePaginationPresenter.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation

protocol BasePaginationPresenterView {
    func fetch(ptr: Bool)
    func loadMore()
    func itemSelected(position: Int)
    func allItemsLoaded()
}

class BasePaginationPresenter<Element: Codable, Navigator: BaseNavigator, ItemViewModel: BaseViewModel<Element>>: BasePaginationPresenterView {

    var items: [Element] = []
    var useCase: UseCaseImp<DnDResult<Element>>
    var useCaseType: UseCaseType
    var viewController: BasePaginationViewPresenter
    var navigator: Navigator
    var isLoading: Bool = false
    var page: Int = 1
    var next: String?

    init(useCase: UseCaseImp<DnDResult<Element>>, useCaseType: UseCaseType, viewController: BasePaginationViewPresenter, navigator: Navigator) {
        self.useCase = useCase
        self.useCaseType = useCaseType
        self.viewController = viewController
        self.navigator = navigator
    }

    func fetch(ptr: Bool) {
        if ptr {
            self.items = []
            page = 1
        }
        isLoading = true
        useCase.execute(page: page, type: useCaseType) { [self] result in
            switch result {
            case .success(let paginationResult):
                handleResult(paginationResult: paginationResult)
                checkPTR(ptr: ptr)
                page += 1
            case .failure(let error):
                self.checkPTR(ptr: ptr)
                self.viewController.showError(errorMessage: error.toString())
            }
        }
    }

    func checkPTR(ptr: Bool) {
        if ptr {
            self.viewController.hidePTR()
        }
    }

    func handleResult(paginationResult: DnDResult<Element>) {
        self.items.append(contentsOf: paginationResult.results)
        self.updateItems(items: paginationResult.results)
        self.next = paginationResult.next
    }

    func updateItems(items: [Element]) {
        let viewModels = items.map({ItemViewModel(with: $0)})
        viewController.setup(viewModels)
    }

    func loadMore() {
        if next != nil, !isLoading {
            fetch(ptr: false)
        }
    }

    func itemSelected(position: Int) {
        navigator.toItem(items[position])
    }

    func allItemsLoaded() {
        isLoading = false
    }
}
