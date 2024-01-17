//
//  Protocols.swift
//  PokeExamen
//
//  Created by Victor Perez on 16/01/24.
//

import Foundation

protocol HomePresenterProtocol : AnyObject{
    var view : HomePresenterToView? {get set}
    var interactor : HomePresenterToInteractor? {get set}
    
    
}
protocol HomeInteractorProtocol : AnyObject {
    var presenter : HomeInteractorToPresenter? {get set}
}
protocol HomePresenterToInteractor : AnyObject{
    func getPokemon()
}
protocol HomeInteractorToPresenter : AnyObject{
    func fetchPokemonSuccesfully(pokemon : PokemonModel)
    func fetchPokemonFailed()
}

protocol HomePresenterToView : AnyObject {
    func reloadInfo()
}

protocol HomeViewToPresenter : AnyObject {
    func viewDidLoad()
    func getPokemon()
    var pokemons : [PokemonModel] {get set}

}
