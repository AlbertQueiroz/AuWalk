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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

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
    
    @objc func initAnimate() {
        circle.cardFood.progressCircle.add(animatingCircle(fromValue: 0, toValue: 1), forKey: "Stroke End")
    }
    
    func animatingCircle (fromValue: Float, toValue: Float) -> CABasicAnimation {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = toValue
        basicAnimation.fromValue = fromValue
        basicAnimation.duration = 1
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        return basicAnimation
    }
    

    
}


