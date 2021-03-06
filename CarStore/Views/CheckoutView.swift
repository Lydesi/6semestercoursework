//
//  CheckoutView.swift
//  CarStore
//
//  Created by Seydali Seydametov.
//  Copyright © 2022 Seydali Seydametov. All rights reserved.
//

import UIKit

class CheckoutView : UIView
{
    @IBOutlet private weak var labelBasketDescription: UILabel!
    @IBOutlet private weak var labelHint: UILabel!
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToSuperview()
    {
        setup()
    }
    
    func setup()
    {
        let layoutGuide = safeAreaLayoutGuide
        
        labelHint.translatesAutoresizingMaskIntoConstraints = false
        labelHint.widthAnchor.constraint(equalTo: layoutGuide.widthAnchor, multiplier: 0.8).isActive = true
        labelHint.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor).isActive = true
        labelHint.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 15.0).isActive = true
        labelHint.textAlignment = .center
        labelHint.numberOfLines = 3
        
        labelBasketDescription.translatesAutoresizingMaskIntoConstraints = false
        labelBasketDescription.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor).isActive = true
        labelBasketDescription.topAnchor.constraint(equalTo: labelHint.bottomAnchor, constant: 10.0).isActive = true
        labelBasketDescription.textAlignment = .center
    }
}

// MARK: - Methods used by the view controller to manipulate the interface
extension CheckoutView
{
    func update(viewModel: CheckoutViewModel?)
    {
        DispatchQueue.main.async {
            self.labelBasketDescription.text = viewModel?.basketDescription
        }
    }
}

// MARK: - Factories
extension CheckoutView
{
    class func create(owner: Any) -> CheckoutView?
    {
        let bundle = Bundle.main
        let nibName = String(describing: CheckoutView.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        return nib.instantiate(withOwner: owner, options: nil).first as? CheckoutView
    }
}
