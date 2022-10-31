//
//  StepCounter.swift
//  AuWalk
//
//  Created by Tales Conrado on 17/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import HealthKit

struct CoinTracker: Codable {
    var coinsSpent: Double
    var coinsEarned: Double
}

enum StepsFromDate {
    case today, thisWeek
}

class StepsCounterModel: MoneyDelegate {

    var healthStore: HKHealthStore?
    var coinTracker: CoinTracker?
    private let plistFile = "CoinTracker.plist"
    
    init() {
        if !HKHealthStore.isHealthDataAvailable() {
            print("HKStore isn't available.")
        } else {
            healthStore = HKHealthStore()
        }

        checkHKAvailability()
        coinTracker = CoinTracker(
            coinsSpent: 0.0,
            coinsEarned: 0.0
        )
        loadCoinsFromFile()
    }
    
    func checkHKAvailability() {
        let typesToRead = Set([HKQuantityType.quantityType(forIdentifier: .stepCount)!])
        
        healthStore?.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
            if !success {
                print("An error occurred while asking for permission to read data.")
            }
        }
    }
    
    
    func fetchSteps(from date: StepsFromDate, completion: @escaping (Double) -> Void) {
        
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
    
    func updateBalance(currentCoinsLabel: Double) {
        
        guard var coinTracker = self.coinTracker else {
            print("CoinTracker not initialized.")
            return
        }
        
        let coinsDifference = (currentCoinsLabel - coinTracker.coinsEarned) * 0.2
        coinTracker.coinsEarned = currentCoinsLabel * 0.2
        
        if coinsDifference <= 0 {
            coinTracker.coinsSpent = 0
        }
        
        self.coinTracker = coinTracker
        
        saveCoinsToFile()
    }
    
    func spendMoney(newExpense: Double) {
        
        guard var coinTracker = self.coinTracker else {
            print("CoinTracker not initialized.")
            return
        }
        
        coinTracker.coinsSpent = coinTracker.coinsSpent + newExpense
        self.coinTracker = coinTracker
        saveCoinsToFile()
    }
    
    func saveCoinsToFile() {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(plistFile)
        do {
            let data = try encoder.encode(coinTracker)
            try data.write(to: path)
            print("Saved coins to file.")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadCoinsFromFile() {
        
        let path = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )[0].appendingPathComponent(plistFile)
        
        guard let data = try? Data(contentsOf: path) else {
            saveCoinsToFile()
            return
        }
        
        let decoder = PropertyListDecoder()
        
        guard let plist = try? decoder.decode(CoinTracker.self, from: data) else {
            print("Couldn't convert to plist.")
            return
        }
        
        print("Loaded.")
        self.coinTracker = plist
    }
    
}

protocol MoneyDelegate {
    
    func spendMoney(newExpense: Double)
    
}
