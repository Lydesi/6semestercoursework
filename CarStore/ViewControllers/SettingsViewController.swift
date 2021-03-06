//
//  SettingsViewController.swift
//  CarStore
//
//  Created by Seydali Seydametov.
//  Copyright © 2022 Seydali Seydametov. All rights reserved.
//

import UIKit

class SettingsViewController : UIViewController
{
    private var customView: SettingsView?
    
    private var presenter: SettingsPresenterDelegate? = nil
    
    init(withPresenter presenter: SettingsPresenter)
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
        self.customView = self.view as? SettingsView
        
        navigationItem.title = "Settings"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(actionSave(_:)))
    }
}

// MARK: - Delegate
extension SettingsViewController : SettingsViewDelegate
{
    func updateCurrencyPicker(dataSource: SettingsCurrencyDataSource?, delegate: SettingsCurrencyDelegate?)
    {
        customView?.updateCurrencyPicker(dataSource: dataSource, delegate: delegate)
    }
    
    func updateThemesPicker(dataSource: SettingsThemesDataSource?, delegate: SettingsThemesDelegate?)
    {
        customView?.updateThemesPicker(dataSource: dataSource, delegate: delegate)
    }
    
    func selectCurrencyPickerValue(row: Int)
    {
        customView?.selectCurrencyPickerValue(row: row)
    }
    
    func selectThemePickerValue(row: Int)
    {
        customView?.selectThemePickerValue(row: row)
    }
}

// MARK: - Delegate
extension SettingsViewController : SettingsCurrencyViewDelegate
{
    func didSelectCurrency(currencyName: CurrencyName)
    {
        presenter?.didSelectCurrency(currencyName: currencyName)
    }
}

// MARK: - Delegate
extension SettingsViewController : SettingsThemesViewDelegate
{
    func didSelectTheme(theme: ColorTheme)
    {
        presenter?.didSelectTheme(theme: theme)
    }
}

// MARK: - Navigation item button action
extension SettingsViewController {
    @objc
    func actionSave(_ sender: Any)
    {
        presenter?.saveAndGoBack()
    }
}
