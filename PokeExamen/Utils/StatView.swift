//
//  StatView.swift
//  PokeExamen
//
//  Created by Victor Perez on 17/01/24.
//

import Foundation
import UIKit

class StatView : UIView {
    var overProgressViewWidth : NSLayoutConstraint!
    
    lazy var statName : UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 11, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var powerLabel : UILabel = {
        let label = UILabel()
        label.text = "0/270"
        label.font = .systemFont(ofSize: 11, weight: .bold)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var progressView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(red: 201/255, green: 199/255, blue: 184/255, alpha: 0.8)
        view.addSubview(overProgressView)
        view.addSubview(powerLabel)
        powerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return view
        
    }()
    
    lazy var overProgressView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .red
        return view
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addSubview(statName)
        addSubview(progressView)
        overProgressViewWidth = overProgressView.widthAnchor.constraint(equalToConstant: 10)
        
        NSLayoutConstraint.activate([
            statName.topAnchor.constraint(equalTo: topAnchor),
            statName.leftAnchor.constraint(equalTo: leftAnchor),
            statName.bottomAnchor.constraint(equalTo: bottomAnchor),
            statName.widthAnchor.constraint(equalToConstant: 44),
            overProgressViewWidth,
            overProgressView.leftAnchor.constraint(equalTo: progressView.leftAnchor),
            overProgressView.heightAnchor.constraint(equalTo: progressView.heightAnchor),
            
            progressView.topAnchor.constraint(equalTo: topAnchor),
            progressView.leftAnchor.constraint(equalTo: statName.rightAnchor,constant: 4),
            progressView.rightAnchor.constraint(equalTo: rightAnchor,constant: -4),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    func setupStatBar(with stat : Int ){
        overProgressViewWidth.isActive = false
        let total = overProgressViewWidth.constant + CGFloat(stat)
        overProgressViewWidth = overProgressView.widthAnchor.constraint(equalToConstant: total)
        overProgressViewWidth.isActive = true
        powerLabel.text = "\(stat)/270"
    }
}
