//
//  BaseViewModel.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation

class BaseViewModel<Element> {
    
    let element: Element
    
    required init(with element: Element) {
        self.element = element
    }
    
}
