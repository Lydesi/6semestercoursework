//
//  CheckoutViewModel.swift
//  CarStore
//
//  Created by Seydali Seydametov.
//  Copyright © 2022 Seydali Seydametov. All rights reserved.
//

import Foundation

struct CheckoutViewModel
{
    let carDescriptions : [String]
    let basketDescription: String?
    
    init(carDescriptions: [String], basketDescription: String?)
    {
        self.carDescriptions = carDescriptions
        self.basketDescription = basketDescription
    }
}
