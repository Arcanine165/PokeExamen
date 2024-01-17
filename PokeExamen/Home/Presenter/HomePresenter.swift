//
//  HomePresenter.swift
//  PokeExamen
//
//  Created by Victor Perez on 16/01/24.
//

import Foundation

final class HomePresenter : HomePresenterProtocol,HomeViewToPresenter {
    // MARK: - Attributes
    var interactor: HomePresenterToInteractor?
    weak var view : HomePresenterToView?
    
    
    var pokemons : [PokemonModel] = []
    
    // MARK: - Initialiazer
    
    init(interactor: HomePresenterToInteractor? = nil, view: HomePresenterToView? = nil) {
        self.interactor = interactor
        self.view = view
        
    }
    // MARK: - Functions
    
    func viewDidLoad() {
        getPokemon()
    }
    
    func getPokemon() {
        interactor?.getPokemon()
    }
    
    
}

extension HomePresenter : HomeInteractorToPresenter {
    func fetchPokemonSuccesfully(pokemon : PokemonModel) {
        self.pokemons.append(pokemon)
        view?.reloadInfo()
        
    }
    
    func fetchPokemonFailed() {
        
    }
    
    
}

