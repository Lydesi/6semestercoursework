//
//  CheckoutViewController.swift
//  CarStore
//
//  Created by Seydali Seydametov.
//  Copyright © 2022 Seydali Seydametov. All rights reserved.
//

import UIKit

class CheckoutViewController : UIViewController
{
    private var customView: CheckoutView?
    
    private var presenter: CheckoutPresenterDelegate? = nil
    
    init(withPresenter presenter: CheckoutPresenter)
    {
        super.init(nibName: nil, bundle: nil)
        
        self.presenter = presenter
        presenter.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        initInterface()
        
        self.presenter?.update()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    private func initInterface()
    {
        self.customView = self.view as? CheckoutView
        
        navigationItem.title = "Checkout"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Buy cars!", style: .plain, target: self, action: #selector(actionBuyCars(_:)))
    }
}

// MARK: - Delegate
extension CheckoutViewController : CheckoutViewDelegate
{
    func update(viewModel: CheckoutViewModel?)
    {
        self.customView?.update(viewModel: viewModel)
    }
}

// MARK: - Navigation item button actions
extension CheckoutViewController {
    @objc
    func actionBuyCars(_ sender: Any)
    {
        presenter?.buyCars()
    }
}
