//
//  DnDClassViewModel.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation
import UIKit

final class DnDClassViewModel: BaseViewModel<DnDClass> {
        
    required init(with dndClass: DnDClass) {
        super.init(with: dndClass)
    }
    
    var name: String {
        return element.name
    }
    
    var hitDice: String {
        return element.hitDice
    }
    
    var description: String {
        return element.description
    }
}
