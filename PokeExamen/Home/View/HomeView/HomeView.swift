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
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var button : UIButton = {
        let btn = UIButton()
        btn.setTitle("Un pokemon mas", for: .normal)
        btn.backgroundColor = .systemYellow
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
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
        addSubview(button)
        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: leftAnchor,constant: 8),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            button.rightAnchor.constraint(equalTo: rightAnchor,constant: -8),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            pokemonCollectionView.topAnchor.constraint(equalTo: topAnchor),
            pokemonCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
            pokemonCollectionView.bottomAnchor.constraint(equalTo: button.topAnchor,constant: -8),
            pokemonCollectionView.rightAnchor.constraint(equalTo: rightAnchor)
            
            
        ])
    }
    
}
