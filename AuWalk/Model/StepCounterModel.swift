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
        getSteps(from: .thisWeek, completion: printData(data:))
        
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
    
    
    func getSteps(from date: StepsFromDate, completion: @escaping (Double) -> Void) {
        
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)
        let now = Date()
        let start: Date
        
        
        switch date {
            case .today:
                start = Calendar.current.startOfDay(for: now)
            case .thisWeek:
                let thisWeek = Calendar.current.dateInterval(of: .weekOfMonth, for: now)
                start = thisWeek!.start
        }
        
        let predicate = HKQuery.predicateForSamples(withStart: start, end: now, options: .strictStartDate)
    
        let query = HKStatisticsQuery(quantityType: stepsQuantityType!, quantitySamplePredicate: predicate, options: .cumulativeSum) {
            
            (_, result, _) in
            
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }//End guard let
        
            completion(sum.doubleValue(for: HKUnit.count()))
        }
        
        healthStore?.execute(query)
        
    }
    
    
    
}

enum StepsFromDate {
    
    case today, thisWeek
    
}
