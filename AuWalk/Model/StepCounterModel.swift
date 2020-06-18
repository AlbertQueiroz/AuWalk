//
//  StepCounter.swift
//  AuWalk
//
//  Created by Tales Conrado on 17/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import HealthKit

class StepCounterModel {
    
    var healthStore: HKHealthStore?

    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            print("HKStore is available.")
            healthStore = HKHealthStore()
        } else {
            print("HKStore isn't available.")
        }
        
        checkHKAvailability()
        
    }
    
    func retrieveStepCount() {
        
        
    }
    
    func checkHKAvailability() {
        let typesToRead = Set([HKQuantityType.quantityType(forIdentifier: .stepCount)!])
        
        healthStore?.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
            if !success {
                print("Reading step data was not allowed.")
            }
        }
    }
    
}
