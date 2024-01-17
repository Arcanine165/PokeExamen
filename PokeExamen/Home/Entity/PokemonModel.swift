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
}
struct Sprites : Codable{
    let frontImage : String?
    enum CodingKeys: String, CodingKey {
        case frontImage = "front_default"
    }
}
