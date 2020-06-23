//
//  PetListView.swift
//  AuWalk
//
//  Created by Albert Rayneer on 19/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class PetListView: UICollectionViewCell {
    
    var collectionView: UICollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollection() {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.minimumLineSpacing = 16
//        flowLayout.headerReferenceSize = CGSize(width: 40, height: 40)
        flowLayout.sectionInset = UIEdgeInsets(top: 24, left: 8, bottom: 0, right: 8)
        self.collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(PetListViewCell.self, forCellWithReuseIdentifier: "PetListViewCell")
        collectionView?.backgroundColor = .greenLight
        collectionView?.dragInteractionEnabled = true
        
        self.addSubview(collectionView!)
        NSLayoutConstraint.activate([
            self.collectionView!.topAnchor.constraint(equalTo: self.topAnchor),
            self.collectionView!.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView!.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView!.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
}

extension PetListView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetListViewCell", for: indexPath)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = CGSize(width: 80, height: 80)
        return itemSize
    }
    
    
}

class PetListViewCell: UICollectionViewCell {
    
    let petImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dog")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupPetImage()
        
        self.backgroundColor = .white
        self.layer.cornerRadius = self.frame.height/2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPetImage() {
        self.addSubview(petImage)
        
        NSLayoutConstraint.activate([
            self.petImage.heightAnchor.constraint(equalToConstant: 50),
            self.petImage.widthAnchor.constraint(equalToConstant: 50),
            self.petImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.petImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
    
}
