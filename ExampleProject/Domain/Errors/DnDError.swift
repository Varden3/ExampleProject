//
//  DnDError.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation

public struct DnDError: Codable, Error {

    public let errorCode: String?

    public init(errorCode: String?) {
        self.errorCode = errorCode
    }
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
    }
    
    func toString() -> String {
        guard let errorCode = errorCode else { return "" }
        switch CommonError(rawValue: errorCode) {
        case .COMMON_ERROR:
            return "ERROR".localized()
        default:
            return ""
        }
    }
}
