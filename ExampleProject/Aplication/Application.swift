//
//  Application.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation
import UIKit

final class Application {
    static let shared = Application()

    private let useCaseProvider: UseCaseProvider
    private var navigatorProvider: NavigatorProvider?

    private init() {
        self.useCaseProvider = NetworkUseCaseProvider()
    }

    func configureMainInterface(in window: UIWindow) {
        navigatorProvider = NavigatorProvider(services: useCaseProvider)
        let navigationController = navigatorProvider?.makeTabs()
        window.rootViewController = navigationController
    }
}

