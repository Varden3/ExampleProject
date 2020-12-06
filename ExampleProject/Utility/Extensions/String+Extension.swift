//
//  String+Extension.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation

extension String {
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
