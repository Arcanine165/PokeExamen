//
//  PokemonModel.swift
//  PokeExamen
//
//  Created by Victor Perez on 16/01/24.
//

import Foundation

struct PokemonModel : Codable{
    let name : String
    let sprites : Sprites
    let types : [TypeElement]
}

struct Sprites : Codable{
    let frontImage : String?
    enum CodingKeys: String, CodingKey {
        case frontImage = "front_default"
    }
}

struct TypeElement: Codable {
    let slot: Int
    let type: Species
}

struct Species: Codable {
    let name: String
    let url: String
}
