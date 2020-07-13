//
//  PetViewController+ModaConfig.swift
//  AuWalk
//
//  Created by Albert Rayneer on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation
import UIKit

//MARK: Modal Configuration
extension PetViewController {

    enum ModalState {
        case expanded
        case collapsed
    }
    
    func setupModal() {
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = self.view.frame
        self.view.addSubview(visualEffectView)
        
        modalVC = ModalViewController()
        self.addChild(modalVC)
        self.view.addSubview(modalVC.view)
        
        modalVC.view.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PetViewController.handleModalTap(recognzier:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(PetViewController.handleModalPan(recognizer:)))
        
        modalVC.modalView.handleArea.addGestureRecognizer(tapGestureRecognizer)
        modalVC.modalView.handleArea.addGestureRecognizer(panGestureRecognizer)
        //modalVC.modalView.collectionView.addGestureRecognizer(panGestureRecognizer)
        
        
        
    }

   
    @objc func handleModalTap(recognzier:UITapGestureRecognizer) {
        switch recognzier.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
    }
    
    
    @objc func handleModalPan (recognizer:UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            let translation = recognizer.translation(in: self.modalVC.modalView.handleArea)
            var fractionComplete = translation.y / modalHeight
            fractionComplete = modalVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionCompleted: fractionComplete)
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
        
    }
    
    func animateTransitionIfNeeded (state:ModalState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.modalVC.view.frame.origin.y = self.view.frame.height - self.modalHeight
                case .collapsed:
                    self.modalVC.view.frame.origin.y = self.view.frame.height - self.modalHandleAreaHeight
                }
            }
            
            frameAnimator.addCompletion { _ in
                self.modalVisible = !self.modalVisible
                self.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            
            
            let cornerRadiusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                switch state {
                case .expanded:
                    self.modalVC.view.layer.cornerRadius = 0
                case .collapsed:
                    self.modalVC.view.layer.cornerRadius = 16
                }
            }
            
            cornerRadiusAnimator.startAnimation()
            runningAnimations.append(cornerRadiusAnimator)
            
            //calls different functions depending on the state of the modal
            let collectionViewAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                switch state {
                case .expanded:
                    self.modalVC.selectCellExpanded()
                case .collapsed:
                    self.modalVC.diselectCellCollapsing()
                }
            }
            
            collectionViewAnimator.startAnimation()
            runningAnimations.append(collectionViewAnimator)
        }
    }
    
    func startInteractiveTransition(state:ModalState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    
    func updateInteractiveTransition(fractionCompleted:CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    func continueInteractiveTransition (){
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }
    
}
