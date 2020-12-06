//
//  UseCaseProvider.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation

protocol UseCaseProvider {
    func makeUseCase<Element: Codable>() -> UseCaseImp<Element>
}
