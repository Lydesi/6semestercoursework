//
//  BasketViewModel.swift
//  CarStore
//
//  Created by Seydali Seydametov.
//  Copyright © 2022 Seydali Seydametov. All rights reserved.
//

import Foundation

struct BasketViewModel
{
    let carDescriptions : [String]
    let totalPrice: String?
    
    init(carDescriptions: [String], totalPrice: String?)
    {
        self.carDescriptions = carDescriptions
        self.totalPrice = totalPrice
    }
}
