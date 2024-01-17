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
    
    lazy var pokemonTypes : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        label.layer.cornerRadius = 10
        
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        
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
        contentView.backgroundColor = .systemPink
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        contentView.layer.shadowRadius = 5
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowColor = UIColor.black.cgColor

        contentView.addSubview(pokemonImage)
        contentView.addSubview(pokemonName)
        contentView.addSubview(pokemonTypes)
        NSLayoutConstraint.activate([
            
            pokemonImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            pokemonImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            pokemonImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            pokemonImage.heightAnchor.constraint(equalToConstant: 100),
            
            pokemonName.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor),
            pokemonName.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            pokemonName.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            pokemonTypes.topAnchor.constraint(equalTo: pokemonName.bottomAnchor,constant: 3),
            pokemonTypes.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 8),
            pokemonTypes.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -8)
            
        ])
    }
    func configurePokemon(with pokemon : PokemonModel){
        let pokemonTypeColor = UIColor(named: pokemon.types.first?.type.name ?? "normal") ?? UIColor(named: "normal")
        contentView.backgroundColor = pokemonTypeColor
        pokemonImage.kf.setImage(with: URL(string: pokemon.sprites.frontImage ?? ""))
        pokemonName.text = pokemon.name
        setupPokemonTypes(with: pokemon.types)
        
    }
    func setupPokemonTypes(with types : [TypeElement]?){
        guard let types = types else {return}
        if types.count > 1 {
            pokemonTypes.text = "\(types[0].type.name)/\(types[1].type.name)"
        }else{
            pokemonTypes.text = "\(types[0].type.name)"
            
        }
    }
}
