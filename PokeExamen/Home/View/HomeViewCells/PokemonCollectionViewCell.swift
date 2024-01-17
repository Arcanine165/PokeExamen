//
//  PokemonCollectionViewCell.swift
//  PokeExamen
//
//  Created by Victor Perez on 17/01/24.
//

import UIKit
import Kingfisher

class PokemonCollectionViewCell: UICollectionViewCell {
    static let identifier = "PokemonCollectionViewCell"
    
    lazy var pokemonImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var pokemonName : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        pokemonName.text = nil
        pokemonImage.image = nil
    }
    
    private func setupUI(){
        contentView.addSubview(pokemonImage)
        contentView.addSubview(pokemonName)
        NSLayoutConstraint.activate([
            
            pokemonImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            pokemonImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            pokemonImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            pokemonImage.heightAnchor.constraint(equalToConstant: 100),
            
            pokemonName.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor),
            pokemonName.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            pokemonName.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            
        ])
    }
    func configurePokemon(with pokemon : PokemonModel){
         
        pokemonImage.kf.setImage(with: URL(string: pokemon.sprites.frontImage ?? ""))
        pokemonName.text = pokemon.name
    }
}
