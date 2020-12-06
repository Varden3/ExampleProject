//
//  DnDResult.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

public struct DnDResult<Element: Codable>: Codable {

    public var count: Int
    public var next: String?
    public var previous: String?
    public var results: [Element]
    
    public init(count: Int, next: String?, previous: String?, results: [Element]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
}
