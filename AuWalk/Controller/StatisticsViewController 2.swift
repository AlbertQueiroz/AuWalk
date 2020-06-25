//
//  StatisticsViewController.swift
//  AuWalk
//
//  Created by Albert Rayneer on 18/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

    let statisticsView = StatisticsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBackButtonAction()

        //View
        self.view = statisticsView
        
    }
    
    func setupBackButtonAction() {
        self.statisticsView.backButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    }
    
    @objc func close() {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
