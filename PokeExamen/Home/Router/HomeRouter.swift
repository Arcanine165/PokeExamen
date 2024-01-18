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
    var detailRouter : PokemonDetailRouterProtocol?
    // MARK: - Functions
    
    func setupComponents() {
        controller = HomeViewController()
        let presenter = HomePresenter()
        detailRouter = PokemonDetailRouter()
        presenter.view = controller
        presenter.router = self
        controller?.presenter = presenter
        
        let interactor = HomeInteractor()
        interactor.presenter = presenter
        presenter.interactor = interactor
        
        
    }
    
    func goToDetail(with id: Int) {
        guard let fromVC = controller else {
            return
        }
        
        detailRouter?.showDetail(with: id, from: fromVC)
    }
    
    
}
