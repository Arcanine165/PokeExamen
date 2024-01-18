//
//  HomeRouter.swift
//  PokeExamen
//
//  Created by Victor Perez on 17/01/24.
//

import Foundation


final class HomeRouter : HomeRouterProtocol {
    // MARK: - Attributes
    
    var controller: HomeViewController?
    
    // MARK: - Functions
    
    func setupComponents() {
        controller = HomeViewController()
        let presenter = HomePresenter()
        presenter.view = controller
        presenter.router = self
        controller?.presenter = presenter
        
        let interactor = HomeInteractor()
        interactor.presenter = presenter
        presenter.interactor = interactor
        
        
    }
    
    func goToDetail(with id: Int) {
        let pokemonDetailRouter = PokemonDetailRouter()
        pokemonDetailRouter.showDetail(with: id,from: controller!)
    }
    
    
}
