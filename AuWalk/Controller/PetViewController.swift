//
//  PetViewController.swift
//  AuWalk
//
//  Created by Albert Rayneer on 09/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

var userDataStruct = UserData(steps: 0, normalCoinsTotal: 0, goldenCoinsTotal: 0, levelPet: 0, levelPersonal: 0, statusHeart: 0, statusFood: 0, statusHygiene: 0, statusEnergy: 0)

class PetViewController: UIViewController {
    
    func onInitReadValues(){
        guard let data = readUserDataFromFile() else {return}
        userDataStruct.steps = data.steps
        userDataStruct.goldenCoinsTotal = data.goldenCoinsTotal
        userDataStruct.levelPersonal = data.levelPersonal
        userDataStruct.levelPet = data.levelPet
        userDataStruct.normalCoinsTotal = data.normalCoinsTotal
        userDataStruct.statusEnergy = data.statusEnergy
        userDataStruct.statusFood = data.statusFood
        userDataStruct.statusHeart = data.statusHeart
        userDataStruct.statusHygiene = data.statusHygiene
    }
    
    func updateStatusValues() {
        
        
        userDataStruct.statusHeart = 0
        
        let _ = updateUserDataFile(data: userDataStruct)

        if modalVC.statusLayers != [] {
            modalVC.animatingCircle(layer: modalVC.statusLayers[0] ?? CAShapeLayer(), from: modalVC.managerData.statusHeart, to: 0, mode: .backwards)
        }
        
        modalVC.managerData.statusHeart = 0
        
    }
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateStatusValues()
        
        onInitReadValues()


        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateHandler), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = petView
        setupModal()
        setupTopBar()
        
        stepsCounterModel.fetchSteps(from: .today, completion: petView.updateStepsLabel)
        
    }
    
    func setField () {
        view.addSubview(circle)
        circle.backgroundColor = .greenLight
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        circle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        circle.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        circle.heightAnchor.constraint(equalToConstant: 58).isActive = true
        
    }
    
    @objc func updateHandler() {
        stepsCounterModel.fetchSteps(from: .today, completion: petView.updateStepsLabel)
    }
    
    func setupTopBar() {
        topBar.statsButton.addTarget(self, action: #selector(openStatisticsVC), for: .touchUpInside)
        
        view.addSubview(topBar)
        NSLayoutConstraint.activate([
            
            topBar.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            topBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            topBar.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    @objc func openStatisticsVC() {
        let destination = StatisticsViewController()
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    public func setCirclePositions(fromValue: CGFloat){
        let initingValue = fromValue  / 8
        circle.cardHeart.progressCircle.position = CGPoint(x: initingValue, y: 29)
        circle.cardFood.progressCircle.position = CGPoint(x: initingValue * 3, y: 29)
        circle.cardHygiene.progressCircle.position = CGPoint(x: initingValue * 5, y: 29)
        circle.cardEnergy.progressCircle.position = CGPoint(x:initingValue * 7, y: 29)
        
        circle.cardHeart.imageIconView.frame = CGRect(origin: CGPoint(x: circle.cardHeart.progressCircle.position.x-10, y: circle.cardHeart.progressCircle.position.y-10), size: CGSize(width: 20, height: 20))
        
        circle.cardFood.imageIconView.frame = CGRect(origin: CGPoint(x: circle.cardFood.progressCircle.position.x-10, y: circle.cardFood.progressCircle.position.y-10), size: CGSize(width: 20, height: 20))
        circle.cardHygiene.imageIconView.frame = CGRect(origin: CGPoint(x: circle.cardHygiene.progressCircle.position.x-10, y: circle.cardHygiene.progressCircle.position.y-10), size: CGSize(width: 20, height: 20))
        circle.cardEnergy.imageIconView.frame = CGRect(origin: CGPoint(x: circle.cardEnergy.progressCircle.position.x-10, y: circle.cardEnergy.progressCircle.position.y-10), size: CGSize(width: 20, height: 20))
        
    }
    
}


