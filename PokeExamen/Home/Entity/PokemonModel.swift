//
//  PokemonModel.swift
//  PokeExamen
//
//  Created by Victor Perez on 16/01/24.
//

import Foundation

struct PokemonModel : Codable{
    let id : Int
    let name : String
    let sprites : Sprites
    let types : [TypeElement]
    let stats : [Stats]
}
struct Stats : Codable {
    let baseStat : Int
    let effort : Int
    let stat : SingleElement
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat",effort,stat
    }
}
struct Sprites : Codable{
    let frontImage : String?
    enum CodingKeys: String, CodingKey {
        case frontImage = "front_default"
    }
}

struct TypeElement: Codable {
    let slot: Int
    let type: SingleElement
}

struct SingleElement: Codable {
    let name: String
    let url: String
}
