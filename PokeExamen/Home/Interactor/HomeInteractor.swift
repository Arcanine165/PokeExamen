//
//  HomeInteractor.swift
//  PokeExamen
//
//  Created by Victor Perez on 17/01/24.
//

import Foundation

final class HomeInteractor : HomeInteractorProtocol, HomePresenterToInteractor{
    weak var presenter: HomeInteractorToPresenter?
    
    func getPokemon() {
        let random = Int.random(in: 1...1000)
        Networking.shared.setRequest(type: PokemonModel.self, endpoint: .pokemon, param: "\(random)", httpMethod: "GET" ) {[weak self] result in
            switch result {
            case .success(let response):
                self?.presenter?.fetchPokemonSuccesfully(pokemon: response )
                print(response)
            case .failure(let failure):
                print(failure)

            }
        }
    }
    
    
}


