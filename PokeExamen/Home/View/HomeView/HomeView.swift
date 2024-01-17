//
//  HomeView.swift
//  PokeExamen
//
//  Created by Victor Perez on 17/01/24.
//

import UIKit

class HomeView: UIView {

    lazy var pokemonCollectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: flowLayout)
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pokemonCollectionView)
        NSLayoutConstraint.activate([
            pokemonCollectionView.topAnchor.constraint(equalTo: topAnchor),
            pokemonCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
            pokemonCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            pokemonCollectionView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
}
