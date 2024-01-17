//
//  HomeRouter.swift
//  PokeExamen
//
//  Created by Victor Perez on 17/01/24.
//

import Foundation
protocol HomeRouterProtocol {
    var controller : HomeViewController? {get set}
    func setupComponents()
    func goToDetail()
}

final class HomeRouter : HomeRouterProtocol {
    var controller: HomeViewController?
    
    func setupComponents() {
        controller = HomeViewController()
        let presenter = HomePresenter()
        presenter.view = controller
        
        controller?.presenter = presenter
        
        let interactor = HomeInteractor()
        interactor.presenter = presenter
        presenter.interactor = interactor
        
        
    }
    
    func goToDetail() {
        
    }
    
    
}
