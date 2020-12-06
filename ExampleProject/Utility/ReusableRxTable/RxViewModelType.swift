//
//  RxViewModelType.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 05/12/2020.
//

import Foundation

protocol RxViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
