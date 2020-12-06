//
//  UseCaseImp.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation
import RxSwift

final class UseCaseImp<Element: Codable>: UseCase {
    
    private let repository: RepositoryImp<Element>

    init(repository: RepositoryImp<Element>) {
        self.repository = repository
    }

    func execute(type: UseCaseType, _ completion: @escaping (Result<Element, DnDError>) -> Void) {
        return repository.execute(type: type, completion)
    }
    
    func execute(page: Int, type: UseCaseType, _ completion: @escaping (Result<Element, DnDError>) -> Void) {
        return repository.execute(page: page, type: type, completion)
    }
    
    func execute(type: UseCaseType) -> Observable<Element> {
        return repository.execute(type: type)
    }
}
