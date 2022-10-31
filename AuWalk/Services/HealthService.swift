//
//  HealthService.swift
//  AuWalk
//
//  Created by Fernando de Lucas da Silva Gomes on 31/10/22.
//  Copyright © 2022 AuWalk. All rights reserved.
//

import HealthKit

class HealthService {

    private let healthStore: HKHealthStore?
    
    init() {
        healthStore = HKHealthStore()
        checkHKAvailability()
    }

    func fetchSteps(
        from date: StepsFromDate,
        completion: @escaping (Double) -> Void
    ) {
        
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)
        let now = Date()
        let start: Date
        
        //Getting date based on parameter
        switch date {
            case .today:
                start = Calendar.current.startOfDay(for: now)
            case .thisWeek:
                let thisWeek = Calendar.current.dateInterval(of: .weekOfMonth, for: now)
                start = thisWeek!.start
        }
        
        let predicate = HKQuery.predicateForSamples(
            withStart: start,
            end: now,
            options: .strictStartDate
        )
    
        let query = HKStatisticsQuery(
            quantityType: stepsQuantityType!,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) {
            
            (_, result, _) in
            
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }//End guard let
        
            completion(sum.doubleValue(for: HKUnit.count()))
        }//End query closure
        
        healthStore?.execute(query)
    }
    
    
    private func checkHKAvailability() {
        let typesToRead = Set([HKQuantityType.quantityType(forIdentifier: .stepCount)!])
        
        healthStore?.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
            if !success {
                print("An error occurred while asking for permission to read data.")
            }
        }
    }

}
