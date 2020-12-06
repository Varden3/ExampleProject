//
//  NetworkImp.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Alamofire
import RxSwift

public final class NetworkImp<Element: Codable> {
    private let network: Network<Element>

    init(network: Network<Element>) {
        self.network = network
    }

    public func execute(type: UseCaseNetworkType, _ completion: @escaping (Result<Element, DnDError>) -> Void) {
        network.updateHeaders()
        return network.makeRequest(type: type) { result in
            switch result {
            case .success(let data):
                guard let item = try? JSONDecoder().decode(Element.self, from: data) else {
                    guard let error = try? JSONDecoder().decode(DnDError.self, from: data) else {
                        completion(.failure(DnDError(errorCode: CommonError.COMMON_ERROR.rawValue)))
                        return
                    }
                    completion(.failure(error))
                    return
                }
                completion(.success(item))
            case .failure:
                completion(.failure(DnDError(errorCode: CommonError.COMMON_ERROR.rawValue)))
            }
        }
    }
    
    public func execute(page: Int, type: UseCaseNetworkType, _ completion: @escaping (Result<Element, DnDError>) -> Void) {
        network.updateHeaders()
        return network.makeRequest(page: page, type: type) { result in
            switch result {
            case .success(let data):
                guard let item = try? JSONDecoder().decode(Element.self, from: data) else {
                    guard let error = try? JSONDecoder().decode(DnDError.self, from: data) else {
                        completion(.failure(DnDError(errorCode: CommonError.COMMON_ERROR.rawValue)))
                        return
                    }
                    completion(.failure(error))
                    return
                }
                completion(.success(item))
            case .failure(_):
                completion(.failure(DnDError(errorCode: CommonError.COMMON_ERROR.rawValue)))
            }
        }
    }
    
    func execute(type: UseCaseNetworkType) -> Observable<Element> {
        return network.makeRequest(type: type)
    }
}

struct MapFromNever: Error {}
extension ObservableType where Element == Never {
    func map<T>(to: T.Type) -> Observable<T> {
        return self.flatMap { _ in
            return Observable<T>.error(MapFromNever())
        }
    }
}
