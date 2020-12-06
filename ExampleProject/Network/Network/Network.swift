//
//  Network.swift
//  ExapmleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

final class Network<T: Decodable> {

    private let endPoint: String
    private var headers: [String:String]
    private let scheduler: ConcurrentDispatchQueueScheduler
    //private let accessKey: String

    init(_ endPoint: String, headers: [String:String]) {
        self.endPoint = endPoint
        //self.accessKey = accessKey
        self.headers = headers
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func updateHeaders() {
        //let accessToken = UserDefaults.standard.string(forKey: "sessionToken") ?? ""
        //headers.updateValue(accessToken, forKey: "ACCESS_TOKEN_SERIAL")
    }

    func makeRequest(type: UseCaseNetworkType, _ completion: @escaping (Result<Data, Error>) -> Void)  {
        let absolutePath = "\(endPoint)\(type.endpoint)"
        let httpHeaders = HTTPHeaders(headers)
        AF.request(absolutePath, method: type.method, parameters: type.params, headers: httpHeaders)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    func makeRequest(page: Int, type: UseCaseNetworkType, _ completion: @escaping (Result<Data, Error>) -> Void)  {
        let absolutePath = "\(endPoint)\(type.endpoint)"
        let httpHeaders = HTTPHeaders(headers)
        var params = type.params ?? [:]
        params.updateValue(page, forKey: "page")
        AF.request(absolutePath, method: type.method, parameters: params, headers: httpHeaders)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    func makeRequest(type: UseCaseNetworkType) -> Observable<T> {
        let absolutePath = "\(endPoint)\(type.endpoint)"
        let httpHeaders = HTTPHeaders(headers)
        return RxAlamofire
            .data(type.method, absolutePath, headers: httpHeaders)
            .debug()
            .observeOn(scheduler)
            .map({ data -> T in
                let item = try JSONDecoder().decode(T.self, from: data)
                return item
            })
    }
}
