//
//  MainScreenMainScreenInteractorOutput.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 08/09/2020.
//  Copyright © 2020 FlatStack. All rights reserved.
//

import Foundation

protocol MainScreenInteractorOutput: class {
    func countriesFetchSuccess(countries: [CountryModel])
    func countriesFetchFailed()
    
    func countryFetchSuccess(country: CountryModel)
    func countryFetchFalied()
    
//    func getImageFromURLSuccess(country: CountryModel, data: Data)
//    func getImageFromURLError(country: CountryModel)

}
