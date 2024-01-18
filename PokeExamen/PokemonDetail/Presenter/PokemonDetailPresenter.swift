//
//  PokemonDetailPresenter.swift
//  PokeExamen
//
//  Created by Victor Perez on 17/01/24.
//

import Foundation

final class PokemonDetailPresenter : PokemonDetailPresenterProtocol{
    
    var id: Int!
    
    weak var view: PokemonDetailPresenterToView?
    
    var interactor: PokemonDetailPresenterToInteractor?
    
    weak var router : PokemonDetailRouterProtocol?
    
}

extension PokemonDetailPresenter : PokemonDetailViewToPresenter {
    
    func dissmissView() {
        router?.dissmissDetail()
    }
    
    func getPokemon() {
        interactor?.getPokemonById(with: id)
    }
    
    
}
extension PokemonDetailPresenter : PokemonDetailInteractorToPresenter {
    
    func fetchPokemonSuccesfully(pokemon: PokemonModel) {
        view?.showInfo(for: pokemon)
    }
    
    func fetchPokemonFailed() {
        print("error")
    }
    
    
}

