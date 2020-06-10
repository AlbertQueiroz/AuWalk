//
//  PetViewController.swift
//  AuWalk
//
//  Created by Albert Rayneer on 09/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class PetViewController: UIViewController {

    //View
    let petView = PetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = petView
//        view.backgroundColor = .red
    }
    
}
