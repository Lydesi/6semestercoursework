//
//  StoreModelTests.swift
//  CarStoreTests
//
//  Created by Seydali Seydametov.
//  Copyright © 2022 Seydali Seydametov. All rights reserved.
//

import XCTest
@testable import CarStore

class StoreModelTests: XCTestCase {

    override func setUp()
    {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCurrencies()
    {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let a = StoreCurrency(name: .USD, exchangeRate: 1.0)
        let b = StoreCurrency(name: .BGN, exchangeRate: 0.5)
        let c = StoreCurrency(name: .EUR, exchangeRate: 0.9)
        
        let store = Store(withCars: [], defaultCurrency: a, currencies: [a, b, c])
        
        XCTAssert(store.getCurrency(byName: .USD) != nil, "Store does not contain the currency given at initialization")
        XCTAssert(store.getCurrency(byName: .BGN) != nil, "Store does not contain the currency given at initialization")
        XCTAssert(store.getCurrency(byName: .EUR) != nil, "Store does not contain the currency given at initialization")
    }
}
