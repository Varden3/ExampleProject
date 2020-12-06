//
//  UseCase.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation
import RxSwift

public protocol UseCase {
    associatedtype Item: Codable
    func execute(type: UseCaseType, _ completion: @escaping (Result<Item, DnDError>) -> Void)
    func execute(page: Int, type: UseCaseType, _ completion: @escaping (Result<Item, DnDError>) -> Void)
    
    func execute(type: UseCaseType) -> Observable<Item>
}
