//
//  PokemonDetailViewController.swift
//  PokeExamen
//
//  Created by Victor Perez on 17/01/24.
//

import UIKit

class PokemonDetailViewController: UIViewController, PokemonDetailViewProtocol {
   
    // MARK: - Properties
    
    var presenter: PokemonDetailViewToPresenter?
    
    var pokemonDetailView : PokemonDetailView!
    
    // MARK: - LifeCycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        pokemonDetailView = PokemonDetailView()
        setupUI()
        setupGestureRecognizers()
        presenter?.getPokemon()
    }
    
    // MARK: - Functions
    
    func setupUI(){
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        view.addSubview(pokemonDetailView)
        NSLayoutConstraint.activate([
            pokemonDetailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonDetailView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pokemonDetailView.heightAnchor.constraint(equalToConstant: 450),
            pokemonDetailView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func setupGestureRecognizers(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dissmissDetail(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
   
    @objc func dissmissDetail(_ gesture : UITapGestureRecognizer){
        presenter?.dissmissView()
    }
}

extension PokemonDetailViewController : PokemonDetailPresenterToView{
    
    func showInfo(for pokemon: PokemonModel) {
        DispatchQueue.main.async { [weak self] in
            self?.pokemonDetailView.setupPokemon(with: pokemon)
        }
        
    }
    
    
}
