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
    var currentCell : CAShapeLayer?
    var stepsCounterModel: StepsCounterModel?
    var petViewVC: PetViewController?

    var managerData = DataManager(data: userDataStruct)
    
    func animatingCircle (layer: CAShapeLayer, from: Float, to: Float) -> Void {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = to
        basicAnimation.fromValue = from
        basicAnimation.duration = 1
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        layer.add(basicAnimation, forKey: "StrokeEnd")
    }
    
    var modalView = ModalView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 72, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4))
    
    var items: [Item] = [] {
        didSet {
            DispatchQueue.main.async {
                self.modalView.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(managerData.steps)
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

    override func viewDidAppear(_ animated: Bool) {
        StoreRepository().read(category: StoreAPI.health) { [weak self] (items) in
            self?.items = items
        }
    }
    
}


extension ModalViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = ItemCell(of: item)
        cell.selectionStyle = .none
        cell.shapeLayer = currentCell
        cell.animatingCircle = self.animatingCircle
        cell.delegate = managerData
        cell.moneyDelegate = stepsCounterModel
        cell.petVC = self.petViewVC
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

extension ModalViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    //- first it allows selection then selects the first cell (FOR NOW...)
    //- then it changes the background of everything to disabled color except the selected cell
    func selectCellExpanded() {
        modalView.collectionView.allowsSelection = true
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        modalView.collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .bottom)
        modalView.handleArea.backgroundColor = .greenDisabledCells
        modalView.collectionView.backgroundColor = .greenDisabledCells
        //Maybe gambs: Reload items when modal appears
        StoreRepository().read(category: StoreAPI.health) { [weak self] (items) in
            self?.items = items
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
    
    //sets colors to greenLight then erases background of cells to prevent them from keeping selected when collapsed
    func diselectCellCollapsing() {
        for cell in modalView.collectionView.visibleCells {
            cell.backgroundColor = .clear
        }
        modalView.collectionView.backgroundColor = .greenLight
        modalView.handleArea.backgroundColor = .greenLight
        modalView.collectionView.allowsSelection = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let cell = collectionView.cellForItem(at: indexPath) as! StoreCell
        
        currentCell = cell.card.progressCircle 
        
        switch indexPath.row{
        case 0:
            StoreRepository().read(category: StoreAPI.health) { [weak self] (items) in
                self?.items = items
            }
        case 1:
            StoreRepository().read(category: StoreAPI.food) { [weak self] (items) in
                self?.items = items
            }
        case 2:
            StoreRepository().read(category: StoreAPI.shower) { [weak self] (items) in
                self?.items = items
            }
        case 3:
            StoreRepository().read(category: StoreAPI.energy) { [weak self] (items) in
                self?.items = items
            }
        default:
            return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StoreCell
        switch indexPath.item {
            case 0:
                cell.arrange(of: .heart)
                currentCell = cell.card.progressCircle
                animatingCircle(layer: cell.card.progressCircle, from: 0, to: managerData.statusHeart)
            case 1:
                cell.arrange(of: .food)
            animatingCircle(layer: cell.card.progressCircle, from: 0, to: managerData.statusFood)
            case 2:
                cell.arrange(of: .hygiene)
                print(managerData.statusHygiene)
            animatingCircle(layer: cell.card.progressCircle, from: 0, to: managerData.statusHygiene)
            case 3:
                cell.arrange(of: .energy)
            animatingCircle(layer: cell.card.progressCircle, from: 0, to: managerData.statusEnergy)
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
