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
        if !HKHealthStore.isHealthDataAvailable() {
            print("HKStore isn't available.")
        } else {
            healthStore = HKHealthStore()
        }

        checkHKAvailability()
        getTodaySteps(completion: printData(data:))
        
    }
    
    func printData(data: Double) {
        print("Passos dados: \(data)")
    }
    
    func checkHKAvailability() {
        let typesToRead = Set([HKQuantityType.quantityType(forIdentifier: .stepCount)!])
        
        healthStore?.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
            if !success {
                print("Reading step data was not allowed.")
            }
        }
    }
    
    
    func getTodaySteps(completion: @escaping (Double) -> Void) {
        
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)
        
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepsQuantityType!, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, _) in
            
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
        
            completion(sum.doubleValue(for: HKUnit.count()))
        }
        
        healthStore?.execute(query)
        
    }
    
}
