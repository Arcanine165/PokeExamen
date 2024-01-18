//
//  Protocols.swift
//  PokeExamen
//
//  Created by Victor Perez on 17/01/24.
//

import Foundation
import UIKit

protocol PokemonDetailRouterProtocol : AnyObject {
    func showDetail(with id : Int,from viewController : UIViewController)
    func dissmissDetail()
    
}

protocol PokemonDetailViewProtocol :AnyObject{
    var presenter : PokemonDetailViewToPresenter? {get set}
}

protocol PokemonDetailPresenterProtocol : AnyObject{
    var id : Int! {get set}
    var interactor : PokemonDetailPresenterToInteractor? {get set}
    var view : PokemonDetailPresenterToView? {get set}
}

protocol PokemonDetailViewToPresenter : AnyObject{
    func getPokemon()
    func dissmissView()
    
}

protocol PokemonDetailPresenterToView : AnyObject {
    func showInfo(for pokemon : PokemonModel)
}

protocol PokemonDetailPresenterToInteractor : AnyObject{
    
    func getPokemonById(with id : Int)
}

protocol PokemonDetailInteractorProtocol : AnyObject{
    var presenter : PokemonDetailInteractorToPresenter? {get set}
}

protocol PokemonDetailInteractorToPresenter : AnyObject{
    func fetchPokemonSuccesfully(pokemon : PokemonModel)
    func fetchPokemonFailed()
}
