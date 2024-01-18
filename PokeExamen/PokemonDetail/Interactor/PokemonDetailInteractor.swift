//
//  PokemonDetailInteractor.swift
//  PokeExamen
//
//  Created by Victor Perez on 17/01/24.
//

import Foundation

final class PokemonDetailInteractor : PokemonDetailInteractorProtocol {
    
    weak var presenter: PokemonDetailInteractorToPresenter?
    
    
}

extension PokemonDetailInteractor : PokemonDetailPresenterToInteractor {
    func getPokemonById(with id: Int) {
        Networking.shared.setRequest(type: PokemonModel.self, endpoint: .pokemon, param: "\(id)", httpMethod: "GET") {[weak self] result in
            switch result {
            case .success(let pokemon):
                self?.presenter?.fetchPokemonSuccesfully(pokemon: pokemon)
            case .failure(let failure):
                self?.presenter?.fetchPokemonFailed()
            }
        }
    }
    
    
}
