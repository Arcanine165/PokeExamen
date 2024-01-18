//
//  ViewController.swift
//  PokeExamen
//
//  Created by Victor Perez on 16/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Attributes
    
    var presenter : HomeViewToPresenter?
    var homeView : HomeView!
    
    // MARK: - ViewCiclye functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        homeView = HomeView()
        setupCollectionView()
        setupUI()
        setupButtonAction()
        setupTimer()
    }
    // MARK: - Functions
    
    func setupTimer(){
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) {[weak self] timer in
            self?.presenter?.getPokemon()
        }
    }
    func setupCollectionView(){
        homeView.pokemonCollectionView.dataSource = self
        homeView.pokemonCollectionView.delegate = self
    }
    func setupButtonAction(){
        homeView.button.addTarget(self, action: #selector(showNewPokemon), for: .touchUpInside)
    }
   
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(homeView)
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.topAnchor),
            homeView.leftAnchor.constraint(equalTo: view.leftAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    // MARK: - OBJC Functions
    
    @objc func showNewPokemon(){
        presenter?.getPokemon()
    }
}

// MARK: - Extension HomePresenterToView

extension HomeViewController : HomePresenterToView{
    func reloadInfo() {
        DispatchQueue.main.async {[weak self] in
            self?.homeView.pokemonCollectionView.reloadData()
        }
    }
    
    
}
// MARK: - Extension UICollectionViewDelegates
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.pokemons.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as! PokemonCollectionViewCell
        if let pokemon = presenter?.pokemons[indexPath.row] {
            cell.configurePokemon(with: pokemon)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width / 2) - 20, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 13)
    }
    
}
