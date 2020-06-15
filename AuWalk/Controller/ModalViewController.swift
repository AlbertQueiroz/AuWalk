//
//  ModalViewController.swift
//  AuWalk
//
//  Created by Albert Rayneer on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    let cellId = "cellId"
    
    var modalView = ModalView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 60, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = modalView
        
        self.modalView.tableView.delegate = self
        self.modalView.tableView.dataSource = self
        self.modalView.tableView.separatorStyle = .none
        
        self.modalView.collectionView.delegate = self
        self.modalView.collectionView.dataSource = self
        
        modalView.collectionView.register(StoreCell.self, forCellWithReuseIdentifier: cellId)
        modalView.collectionView.allowsSelection = false
        modalView.collectionView.backgroundColor = .greenLight

        
    }
    
}


extension ModalViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = Item(name: "Mamadeira", description: "Esse item serve para saciar a fome do seu pet.", price: 400, category: "1")
        let cell = ItemCell(of: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

extension ModalViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func selectCellExpanded() {
        modalView.collectionView.allowsSelection = true
        for cell in modalView.collectionView.visibleCells {
            cell.backgroundColor = .greenDisabledCells
        }
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        modalView.collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .bottom)
        modalView.handleArea.backgroundColor = .greenDisabledCells
        modalView.collectionView.backgroundColor = .greenDisabledCells

    }
    
    func diselectCellCollapsing() {
        for cell in modalView.collectionView.visibleCells {
            cell.backgroundColor = .clear
        }
        modalView.collectionView.backgroundColor = .greenLight
        modalView.handleArea.backgroundColor = .greenLight
        modalView.collectionView.allowsSelection = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StoreCell
        switch indexPath.item {
            case 0:
                cell.arrange(of: .heart)
            case 1:
                cell.arrange(of: .food)
            case 2:
                cell.arrange(of: .hygiene)
            case 3:
                cell.arrange(of: .energy)
            default:
                fatalError("Case doesn't exist.")
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
