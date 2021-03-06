//
//  BasketProductPresenter.swift
//  CarStore
//
//  Created by Seydali Seydametov.
//  Copyright © 2022 Seydali Seydametov. All rights reserved.
//

import UIKit

protocol BasketProductViewDelegate: AnyObject
{
    func update(viewModel: BasketProductViewModel?)
}

protocol BasketProductPresenterDelegate: AnyObject
{
    func update()
    func removeCar()
}

class BasketProductPresenter
{
    private var router : RouterProtocol
    
    weak var delegate: BasketProductViewDelegate?
    
    private var basket: Basket?
    private let car: Car
    private let viewModel: BasketProductViewModel?
    
    required init(withRouter router: Router = Router.singleton, basket: Basket, car: Car)
    {
        self.router = router
        
        self.basket = basket
        self.car = car
        
        self.viewModel = BasketProductViewModel(manufacturer: car.manufacturer,
                                                model: car.model,
                                                description: car.description,
                                                engine: car.engine,
                                                price: car.getPriceWithSymbol(forCurrency: basket.defaultCurrency),
                                                imageURL: car.imageURL)
    }
}

// MARK: - Delegate
extension BasketProductPresenter : BasketProductPresenterDelegate
{
    func update()
    {
        self.delegate?.update(viewModel: viewModel)
    }
    
    func removeCar()
    {
        DispatchQueue.main.async {
            if var basket = self.basket
            {
                basket.remove(self.car)
                
                self.router.goBackFromBasketProduct(withBasket: basket)
            }
        }
    }
}
