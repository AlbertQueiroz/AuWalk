//
//  PetViewController.swift
//  AuWalk
//
//  Created by Albert Rayneer on 09/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class PetViewController: UIViewController {

    let topBar: TopBar = {
        let tb = TopBar()
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()

    let petView = PetView()
//    let modalView = ModalView()
    
    //Modal Properties
    var modalVC: ModalViewController!
    var visualEffectView: UIVisualEffectView!
    let modalHeight: CGFloat = UIScreen.main.bounds.height * 0.4
    let modalHandleAreaHeight: CGFloat = 90
    var modalVisible = false
    var nextState:ModalState {
        return modalVisible ? .collapsed : .expanded
    }
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted:CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = petView
        setupModal()
        //setupModal()
        setupViews()
        setupTopBar()
    }
    
    func setupViews() {
        view.addSubview(topBar)
    }
    
    func setupTopBar() {
        
        NSLayoutConstraint.activate([
        
            topBar.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            topBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            topBar.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
    }
    
    func setupModal() {
        self.view.addSubview(modalView)
        self.modalView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.modalView.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 64),
            self.modalView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.modalView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.modalView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5)
        ])
    }
}


