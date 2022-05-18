//
//  BasketProductViewModel.swift
//  CarStore
//
//  Created by Seydali Seydametov.
//  Copyright © 2022 Seydali Seydametov. All rights reserved.
//

import Foundation

struct BasketProductViewModel
{
    let manufacturer: String?
    let model: String?
    let description: String?
    let engine: String?
    let price: String?
    let imageURL: String?
    
    init(manufacturer: String?, model: String?, description: String?, engine: String?, price: String?, imageURL: String?)
    {
        self.manufacturer = manufacturer
        self.model = model
        self.description = description
        self.engine = engine
        self.price = price
        
        if imageURL == nil && manufacturer != nil
        {
            self.imageURL = CarPhotos.getCarImageURL(forManufacturer: manufacturer!)
        }
        else
        {
            self.imageURL = imageURL
        }
    }
}
