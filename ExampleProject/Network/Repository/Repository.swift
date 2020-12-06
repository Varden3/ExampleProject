//
//  Repository.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation
import RxSwift

protocol Repository {
    associatedtype Item: Codable
    func execute(type: UseCaseType, _ completion: @escaping (Result<Item, DnDError>) -> Void)
    func execute(page: Int, type: UseCaseType, _ completion: @escaping (Result<Item, DnDError>) -> Void)
    func execute(type: UseCaseType) -> Observable<Item>
}

final class RepositoryImp<Element: Codable>: Repository {
    
    private let network: NetworkImp<Element>
        
    init(network: NetworkImp<Element>) {
        self.network = network
    }

    func execute(type: UseCaseType, _ completion: @escaping (Result<Element, DnDError>) -> Void) {
        return network.execute(type: UseCaseNetworkType(type: type), completion)
    }
    
    func execute(page: Int, type: UseCaseType, _ completion: @escaping (Result<Element, DnDError>) -> Void) {
        return network.execute(page: page, type: UseCaseNetworkType(type: type), completion)
    }
    
    func execute(type: UseCaseType) -> Observable<Element> {
        return network.execute(type: UseCaseNetworkType(type: type))
    }
}
