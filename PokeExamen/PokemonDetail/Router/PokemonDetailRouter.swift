//
//  PokemonDetailRouter.swift
//  PokeExamen
//
//  Created by Victor Perez on 17/01/24.
//

import Foundation
import UIKit

final class PokemonDetailRouter : PokemonDetailRouterProtocol{
    
    var fromVC : UIViewController?
    
    func showDetail(with id : Int,from viewController : UIViewController){
        let controller = PokemonDetailViewController()
        self.fromVC = viewController
        let presenter = PokemonDetailPresenter()
        presenter.view = controller
        presenter.router = self
        presenter.id = id
        let interactor = PokemonDetailInteractor()
        interactor.presenter = presenter
        presenter.interactor = interactor
        controller.presenter = presenter
        
        controller.modalPresentationStyle = .overFullScreen
        fromVC?.present(controller, animated: true)
    }
    
    func dissmissDetail(){
        fromVC?.dismiss(animated: true)
    }
}
