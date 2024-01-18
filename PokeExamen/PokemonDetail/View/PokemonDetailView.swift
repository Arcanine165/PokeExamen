//
//  PokemonDetailView.swift
//  PokeExamen
//
//  Created by Victor Perez on 17/01/24.
//

import UIKit

class PokemonDetailView: UIView {
    lazy var pokemonImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var pokemonName : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
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
    
    private func setupUI(){
        self.translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        clipsToBounds = true
        backgroundColor = .green
        alpha = 1.0
        layer.shadowColor = UIColor.black.cgColor
        
        addSubview(pokemonImage)
        addSubview(pokemonName)
        addSubview(pokemonTypes)
        NSLayoutConstraint.activate([
            
            pokemonImage.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            pokemonImage.leftAnchor.constraint(equalTo: leftAnchor,constant: 10),
            pokemonImage.rightAnchor.constraint(equalTo: rightAnchor,constant: -10),
            pokemonImage.heightAnchor.constraint(equalToConstant: 200),
            
            pokemonName.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor,constant: 8),
            pokemonName.leftAnchor.constraint(equalTo: leftAnchor),
            pokemonName.rightAnchor.constraint(equalTo: rightAnchor),
            
            pokemonTypes.topAnchor.constraint(equalTo: pokemonName.bottomAnchor,constant: 3),
            pokemonTypes.leftAnchor.constraint(equalTo: leftAnchor,constant: 30),
            pokemonTypes.rightAnchor.constraint(equalTo: rightAnchor, constant: -30)
            
            
        ])
    }
    func setupPokemon(with pokemon : PokemonModel){
        
        pokemonImage.kf.setImage(with: URL(string: pokemon.sprites.frontImage ?? ""))
        pokemonName.text = pokemon.name
        let pokemonTypeColor = UIColor(named: pokemon.types.first?.type.name ?? "normal") ?? UIColor(named: "normal")
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [pokemonTypeColor?.cgColor,UIColor.white.cgColor]
        layer.insertSublayer(gradient, at: 0)
        let elements = pokemon.types
        setupPokemonTypes(with: elements)
        
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
