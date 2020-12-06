//
//  UseCaseNetworkType.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Alamofire

public struct UseCaseNetworkType {
    
    let type: UseCaseType
    
    init(type: UseCaseType) {
        self.type = type
    }
    
    public var endpoint: String {
        switch type {
        case .classes:
            return "classes/"
        case .classDetail(let id):
            return "classes/\(id)"
        case .example(let id, _):
            return ""
        }
    }
    
    public var method: HTTPMethod {
        switch type {
        case .classes,
             .classDetail:
            return .get
        case .example:
            return .delete
        default:
            return .post
        }
    }
    
    public var params: [String: Any]? {
        switch type {
        case .example(_, let params):
            return params
        default:
            return nil
        }
    }
}
