//
//  OnBoardingViewController.swift
//  AuWalk
//
//  Created by Jose Joao Silva Nunes Alves on 23/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
        
    let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false

        return collection
    }()
    
    let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.hidesForSinglePage = true
        control.translatesAutoresizingMaskIntoConstraints = false
        control.pageIndicatorTintColor = .gray
        control.currentPageIndicatorTintColor = .orangeButton

        return control
    }()
    
        private var currentPage = 0 {
            didSet { pageControl.currentPage = currentPage }
        }
        
        private var onboards = [Onboard]()
        
        init(onboard: [Onboard] = Onboard.mockOnboard()) {
            super.init(nibName: nil, bundle: nil)
            pageControl.numberOfPages = onboard.count
            self.onboards = onboard
        }
    
        required init?(coder: NSCoder) {
            super.init(nibName: nil, bundle: nil)
            let onboard: [Onboard] = Onboard.mockOnboard()
            pageControl.numberOfPages = onboard.count
            self.onboards = onboard
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            constructView()
            setupLayout()
        }
        
        private func constructView() {
            self.view.addSubview(collection)
            collection.dataSource = self
            collection.delegate = self
            
            self.view.addSubview(pageControl)
        }
    
        private func setupLayout() {
            NSLayoutConstraint.activate([
                collection.topAnchor.constraint(equalTo: self.view.topAnchor),
                collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                collection.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                collection.rightAnchor.constraint(equalTo: self.view.rightAnchor),

                pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
                pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        }
       
        func nextPage() {
            if currentPage < onboards.count - 1 {
                currentPage += 1
                collection.scrollToItem(at: IndexPath(row: currentPage, section: 0), at: .centeredHorizontally, animated: true)
            } else {
                presentNewScreen()
            }
        }
    
        func presentNewScreen() {
            UserDefaults.standard.set(1, forKey: "hasSeenOnboard")
            let destinity = PetViewController()
            destinity.modalPresentationStyle = .fullScreen
            self.present(destinity, animated: true, completion: nil)
        }
}

extension OnBoardingViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.setup(onboard: onboards[indexPath.row], action: nextPage, skip: presentNewScreen)
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           currentPage = indexPath.row
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return UIScreen.main.bounds.size
       }
}
