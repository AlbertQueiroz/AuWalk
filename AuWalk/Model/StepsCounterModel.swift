//
//  StepCounter.swift
//  AuWalk
//
//  Created by Tales Conrado on 17/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

protocol MoneyDelegate {
    func spendMoney(newExpense: Double)
}

class StepsCounterModel: MoneyDelegate {

    var healthStore: HealthService
    var coinTracker: CoinTracker?
    private let plistFile = "CoinTracker.plist"
    
    init(healthStore: HealthService = .init()) {
        self.healthStore = healthStore
        coinTracker = CoinTracker(
            coinsSpent: 0.0,
            coinsEarned: 0.0
        )
        loadCoinsFromFile()
    }
    
    func fetchSteps(
        from date: StepsFromDate,
        completion: @escaping (Double, Double) -> Void
    ) {
        healthStore.fetchSteps(
            from: date
        ) { steps in
            self.updateBalance(currentCoinsLabel: steps)
            let pawMoney = self.coinTracker!.coinsEarned - self.coinTracker!.coinsSpent
            completion(steps, pawMoney)
        }
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
