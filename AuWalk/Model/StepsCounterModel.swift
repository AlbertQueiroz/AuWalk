//
//  StepCounter.swift
//  AuWalk
//
//  Created by Tales Conrado on 17/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import HealthKit

struct StepsPool: Codable {
    var todaySteps: Double
    var thisWeekSteps: Double
}

enum StepsFromDate {
    case today, thisWeek
}

class StepsCounterModel {
    
    var healthStore: HKHealthStore?
    var todaySteps: Double?
    var thisWeekSteps: Double?
    
    init() {
        if !HKHealthStore.isHealthDataAvailable() {
            print("HKStore isn't available.")
        } else {
            healthStore = HKHealthStore()
        }

        checkHKAvailability()
        
        //saving to local vars both types of steps
        getSteps(from: .today) { (steps) in self.todaySteps = steps }
        getSteps(from: .thisWeek) { (steps) in self.thisWeekSteps = steps}
        saveStepsToFile()
        
    }
    
    func checkHKAvailability() {
        let typesToRead = Set([HKQuantityType.quantityType(forIdentifier: .stepCount)!])
        
        healthStore?.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
            if !success {
                print("An error occurred while asking for permission to read data.")
            }
        }
    }
    
    
    func getSteps(from date: StepsFromDate, completion: @escaping (Double) -> Void) {
        
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
        
        let predicate = HKQuery.predicateForSamples(withStart: start, end: now, options: .strictStartDate)
    
        let query = HKStatisticsQuery(quantityType: stepsQuantityType!, quantitySamplePredicate: predicate, options: .cumulativeSum) {
            
            (_, result, _) in
            
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }//End guard let
        
            completion(sum.doubleValue(for: HKUnit.count()))
        }//End query closure
        
        healthStore?.execute(query)
    }
    
    func saveStepsToFile() {
        
        let steps = StepsPool(todaySteps: self.todaySteps ?? 0.0, thisWeekSteps: self.thisWeekSteps ?? 0.0)
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Steps.plist")
        do {
            let data = try encoder.encode(steps)
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

