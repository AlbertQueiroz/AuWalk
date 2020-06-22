//
//  StatisticsView.swift
//  AuWalk
//
//  Created by Albert Rayneer on 18/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class StatisticsView: UIView {
    
    var backButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "backButton"), for: .normal)
        
        return button
    }()
    
    var segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl()
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.insertSegment(withTitle: "Estatísticas", at: 0, animated: true)
        segmented.insertSegment(withTitle: "Pets", at: 1, animated: true)
        segmented.selectedSegmentIndex = 0
        segmented.addTarget(self, action: #selector(segmentedDidChange), for: .valueChanged)
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        segmented.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segmented.setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        return segmented
        }()
    
    
    var collectionView: UICollectionView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .greenLight
        self.setupBackButton()
        self.setupSegmentedControl()
        self.setupCollectionView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackButton() {
        self.addSubview(backButton)
        NSLayoutConstraint.activate([
            self.backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            self.backButton.heightAnchor.constraint(equalToConstant: 64),
            self.backButton.widthAnchor.constraint(equalToConstant: 64)
            
        ])
    }
    
    func setupSegmentedControl() {
        self.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            self.segmentedControl.topAnchor.constraint(equalTo: self.topAnchor, constant: 64),
            self.segmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
        ])
    }
    
    @objc func segmentedDidChange() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            collectionView?.scrollToItem(at: IndexPath(row: 0, section: 0), at: .left, animated: true)
            print(0)
        case 1:
            collectionView?.scrollToItem(at: IndexPath(row: 1, section: 0), at: .right, animated: true)
            print(1)
        default:
            return
        }
    }

}

extension StatisticsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.headerReferenceSize = CGSize(width: self.frame.size.width, height: 100)
        self.collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(PetListView.self, forCellWithReuseIdentifier: "PetListView")
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "StatisticsViewCollectionViewCell")
        collectionView?.backgroundColor = .greenLight
        collectionView?.dragInteractionEnabled = true
        collectionView?.isPagingEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
        
        self.addSubview(collectionView!)
        NSLayoutConstraint.activate([
            self.collectionView!.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor),
            self.collectionView!.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView!.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView!.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = collectionView!.frame.size.width
        let currentPage = collectionView!.contentOffset.x / pageWidth
        segmentedControl.selectedSegmentIndex = Int(currentPage)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = CGSize(width: self.bounds.width, height: self.collectionView!.bounds.height)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatisticsViewCollectionViewCell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatisticsViewCollectionViewCell", for: indexPath)
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetListView", for: indexPath)
        default:
            return cell
        }
        
        return cell
    }
    
}
