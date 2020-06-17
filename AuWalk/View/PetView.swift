//
//  PetView.swift
//  AuWalk
//
//  Created by Albert Rayneer on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class PetView: UIView {
    
    var background: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var dog: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dog")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackground()
        setupDog()
        setupInformations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackground() {
        self.addSubview(background)
        self.background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.background.topAnchor.constraint(equalTo: self.topAnchor),
            self.background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.background.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
    func setupDog() {
        self.addSubview(dog)
        self.dog.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.dog.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            self.dog.heightAnchor.constraint(equalTo: self.dog.widthAnchor),
            self.dog.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -64),
            self.dog.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setupInformations() {
        let informations = InformationsView()
        informations.setupInformations(petName: "Boby", message: "Você já doou para algum abrigo hoje? Salve meus amiguinhos!", steps: 76, multiplierSteps: 61)
        self.addSubview(informations)
        
        informations.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            informations.topAnchor.constraint(equalTo: self.dog.bottomAnchor, constant: 32),
            informations.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -300),
            informations.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            informations.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
        ])
    }

}
