//
//  DnDClassDetailViewModel.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 05/12/2020.
//

import UIKit
import RxSwift
import RxCocoa

final class DnDClassDetailViewModel: RxViewModelType {
    
    private let classId: String
    private let useCase: UseCaseImp<DnDClass>
    private let navigator: DnDClassesNavigator

    init(classId: String, useCase: UseCaseImp<DnDClass>, navigator: DnDClassesNavigator) {
        self.classId = classId
        self.useCase = useCase
        self.navigator = navigator
    }

    func transform(input: Input) -> Output {
        let errorTracker = ErrorTracker()
        let dndClass = input.trigger.flatMapLatest {
            return self.useCase.execute(type: .classDetail(id: self.classId))
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
                .asDriver()
        }
        
        let errors = errorTracker.asDriver()
        
        return Output(dndClass: dndClass,
                      error: errors)
    }
}

extension DnDClassDetailViewModel {
    struct Input {
        let trigger: Driver<Void>
    }

    struct Output {
        let dndClass: Driver<DnDClass>
        let error: Driver<Error>
    }
}
