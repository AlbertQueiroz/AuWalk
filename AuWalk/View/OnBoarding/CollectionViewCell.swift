//
//  CollectionViewCell.swift
//  AuWalk
//
//  Created by Jose Joao Silva Nunes Alves on 23/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
        
   static let reuseIdentifier = "OnboardCell"
    
    let image: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    let descriptionLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = .greenLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 56, bottom: 8, right: 56)
        button.layer.cornerRadius = 8
        button.backgroundColor = .orangeButton
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 56, bottom: 8, right: 56)
        button.layer.cornerRadius = 8
        button.backgroundColor = .none
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pular", for: .normal)
        return button
    }()
    
    var buttonAction : (() -> Void)?
    var skipButtonAction : (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .onBoardingBackgroundColor
        constructView()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("No need for that")
    }

    func setup(onboard: Onboard, action: (() -> Void)?, skip: (() -> Void)?) {
        self.image.image = UIImage(named: onboard.image)
        self.descriptionLabel.text = onboard.subtitle
        self.button.setTitle(onboard.buttonTitle, for: .normal)
        self.buttonAction = action
        self.skipButtonAction = skip
    }

    private func constructView() {
        self.addSubview(image)
        self.addSubview(button)
        self.addSubview(descriptionLabel)
        self.addSubview(skipButton)
        button.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(skipButtonWasTapped), for: .touchUpInside)
    }
       
       private func setupLayout() {
           NSLayoutConstraint.activate([
               image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
               image.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -50),
               
               descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
               descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
               descriptionLabel.topAnchor.constraint(equalTo: self.centerYAnchor),
               
               button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
               button.bottomAnchor.constraint(equalTo: skipButton.topAnchor),
               
               skipButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
               skipButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
           ])
       }
       
       @objc private func buttonWasTapped() {
           buttonAction?()
       }
    
        @objc private func skipButtonWasTapped() {
            skipButtonAction?()
        }
}
