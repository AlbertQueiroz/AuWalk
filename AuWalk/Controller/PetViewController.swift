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

    let stepsCounterModel = StepsCounterModel()
    let petView = PetView()
    let modalView = ModalView()
    
    //Modal Properties
    var modalVC: ModalViewController!
    var visualEffectView: UIVisualEffectView!
    let modalHeight: CGFloat = UIScreen.main.bounds.height * 0.4
    let modalHandleAreaHeight: CGFloat = 72
    var modalVisible = false
    var nextState:ModalState {
        return modalVisible ? .collapsed : .expanded
    }
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted:CGFloat = 0
    
    
    let circle = HomePetStatusView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = petView
        setupModal()
        setupTopBar()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateHandler), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func updateHandler() {
        stepsCounterModel.fetchSteps(from: .today, completion: petView.updateStepsLabel)
    }
    
    func setupTopBar() {
        view.addSubview(topBar)
        NSLayoutConstraint.activate([
        
            topBar.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            topBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            topBar.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
}


