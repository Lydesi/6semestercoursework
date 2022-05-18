//
//  Store.swift
//  CarStore
//
//  Created by Seydali Seydametov.
//  Copyright © 2022 Seydali Seydametov. All rights reserved.
//

import Foundation

struct Store
{
    let cars: [Car]
    var defaultCurrency: StoreCurrency
    let currencies: [StoreCurrency]
    
    init(withCars cars: [Car], defaultCurrency: StoreCurrency)
    {
        self.cars = cars
        self.defaultCurrency = defaultCurrency
        self.currencies = [defaultCurrency]
    }
    
    init(withCars cars: [Car], defaultCurrency: StoreCurrency, currencies: [StoreCurrency])
    {
        self.cars = cars
        self.defaultCurrency = defaultCurrency
        self.currencies = currencies
    }
    
    func getCurrency(byName name: CurrencyName) -> StoreCurrency?
    {
        for e in 0..<currencies.count
        {
            if currencies[e].name == name
            {
                return currencies[e]
            }
        }
        
        return nil
    }
}
