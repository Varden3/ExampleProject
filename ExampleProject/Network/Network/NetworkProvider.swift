//
//  NetworkProvider.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation

final class NetworkProvider {
    private let apiEndpoint: String
    //private let accessKey: String
    private var headers: [String:String]

    public init() {
        apiEndpoint = "https://api.open5e.com/" //Bundle.main.object(forInfoDictionaryKey: "TimpUrl") as! String
        //accessKey = "" //Bundle.main.object(forInfoDictionaryKey: "TimpAccessKey") as! String
        //let accessToken = UserDefaults.standard.string(forKey: "sessionToken") ?? ""
        //let language = Locale.current.languageCode ?? ""
        headers = [:]
    }
    
    public func updateheaders() {
        //let accessToken = UserDefaults.standard.string(forKey: "sessionToken") ?? ""
        //let language = Locale.current.languageCode ?? ""
        headers = [:]
    }
    
    public func makeNetwork<Element: Codable>() -> NetworkImp<Element> {
        let network = Network<Element>(apiEndpoint, headers: headers)
        return NetworkImp(network: network)
    }
}
