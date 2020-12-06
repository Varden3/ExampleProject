//
//  UseCaseType.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation

public enum UseCaseType {
    case classes
    case classDetail(id: String)
    case example(id: String, params: [String:Any])
}
