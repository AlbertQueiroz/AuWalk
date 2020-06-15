//
//  ModaView.swift
//  AuWalk
//
//  Created by Albert Rayneer on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class ModalView: UIView {
    
    var handleArea: UIView = {
        let view = UIView()
        return view
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupModal()
        setupHandleArea()
        setupCollectionView()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupModal() {
        self.backgroundColor = .greenLight
        self.layer.cornerRadius = 16
    }
    
    func setupHandleArea() {
        self.addSubview(self.handleArea)
        self.handleArea.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.handleArea.topAnchor.constraint(equalTo: self.topAnchor),
            self.handleArea.heightAnchor.constraint(equalToConstant: 60),
            self.handleArea.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.handleArea.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func setupCollectionView() {
        self.addSubview(collectionView)

        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.collectionView.widthAnchor.constraint(equalToConstant: 260),
            self.collectionView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    func setupTableView() {
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
}

class StoreCell: UICollectionViewCell {
            
    let card = HomePetStatusCardView()
    
    var cellAlpha: CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(card)
        card.translatesAutoresizingMaskIntoConstraints = false
        setupContraints()        
        if let alpha = cellAlpha {
            self.alpha = alpha
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func arrange(of type: CardType) {
        
        switch type {
            case .heart:
                setupHeart()
            case .energy:
                setupEnergy()
            case .hygiene:
                setupHygiene()
            case .food:
                setupFood()
        }    
    }
    
    func setupHeart() {
        card.progressCircle.fillColor = UIColor.clear.cgColor
        card.progressCircle.lineWidth = 4
        card.progressCircle.strokeColor = UIColor.redHeart.cgColor
        card.imageIconView.image = #imageLiteral(resourceName: "heartIcon")
    }
    
    func setupFood() {
        card.progressCircle.fillColor = UIColor.clear.cgColor
        card.progressCircle.lineWidth = 4
        card.progressCircle.strokeColor = UIColor.greenFood.cgColor
        card.imageIconView.image = #imageLiteral(resourceName: "foodIcon")
    }
    
    func setupHygiene() {
        card.progressCircle.fillColor = UIColor.clear.cgColor
        card.progressCircle.lineWidth = 4
        card.progressCircle.strokeColor = UIColor.blueHygiene.cgColor
        card.imageIconView.image = #imageLiteral(resourceName: "hygieneIcon")
    }
    
    func setupEnergy() {
        card.progressCircle.fillColor = UIColor.clear.cgColor
        card.progressCircle.lineWidth = 4
        card.progressCircle.strokeColor = UIColor.orangeEnergy.cgColor
        card.imageIconView.image = #imageLiteral(resourceName: "energyIcon")
    }

    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? UIColor.greenLight : UIColor.clear
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.greenLight : UIColor.clear
        }
    }
        
    func setupContraints() {

        NSLayoutConstraint.activate([
        
            card.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        
        ])
    }
}

enum CardType {
    case heart, food, hygiene, energy
}
