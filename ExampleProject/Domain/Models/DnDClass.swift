//
//  DnDClass.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import Foundation

public struct DnDClass: Codable {

    public var id: String
    public var name: String
    public var hitDice: String
    public var description: String
    
    public init(id: String, name: String, hitDice: String, description: String) {
        self.id = id
        self.name = name
        self.hitDice = hitDice
        self.description = description
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "slug"
        case name
        case hitDice = "hit_dice"
        case description = "desc"
    }
}
