//
//  MainScreenMainScreenViewInput.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 08/09/2020.
//  Copyright © 2020 FlatStack. All rights reserved.
//

protocol MainScreenViewInput: class {

    /**
        @author Alexandr Lavrinovich
        Setup initial state of the view
    */
    
    func showCountries(countries: [CountryModel])
    func showError()
    
//    func imageFromURLSuccess()
//    func imageFromURLError()

    func setupInitialState()
}
