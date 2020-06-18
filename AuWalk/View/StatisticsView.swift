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

        return segmented
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .greenLight
        self.setupBackButton()
        self.setupSegmentedControl()
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
            self.segmentedControl.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 4),
            self.segmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
        ])
    }

}
