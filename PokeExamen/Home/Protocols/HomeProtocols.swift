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

protocol HomeRouterProtocol {
    var controller : HomeViewController? {get set}
    func setupComponents()
    func goToDetail(with id : Int)
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
    func goToPokemonDetail(with id : Int)
    var pokemons : [PokemonModel] {get set}
}
