//
//  PokemonDetailRouter.swift
//  PokeExamen
//
//  Created by Victor Perez on 17/01/24.
//

import Foundation
import UIKit

final class PokemonDetailRouter : PokemonDetailRouterProtocol{
    
    var controller : PokemonDetailViewController?
    func showDetail(with id : Int,from viewController : UIViewController){
        self.controller = PokemonDetailViewController()
        let presenter = PokemonDetailPresenter()
        presenter.view = controller
        presenter.router = self
        presenter.id = id
        let interactor = PokemonDetailInteractor()
        interactor.presenter = presenter
        presenter.interactor = interactor
        controller?.presenter = presenter
        
        controller?.modalPresentationStyle = .overFullScreen
        viewController.present(controller!, animated: true)
    }
    func dissmissDetail(){
        controller?.dismiss(animated: true)
    }
}
