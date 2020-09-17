//
//  MainScreenMainScreenPresenter.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 08/09/2020.
//  Copyright © 2020 FlatStack. All rights reserved.
//
import UIKit

class MainScreenPresenter: MainScreenViewOutput {

    weak var view: MainScreenViewInput?
    var interactor: MainScreenInteractorInput?
    var router: MainScreenRouterInput?

    func viewIsReady() {

    }
    
    func beginFetchCountries() {
        interactor?.fetchCountries()
    }
    
    func showCountry(navigationController: UINavigationController) {
        print("push")
    }
    
    func didSelectRowAt(index: Int) {
        interactor?.fetchCountry(at: index)
    }
}

extension MainScreenPresenter: MainScreenInteractorOutput {
    func countryFetchSuccess(country: CountryModel) {
        router?.pushToCountry(view: view!, with: country)
    }
    
    func countryFetchFalied() {
        print("Country Fetch Failed")
    }
    
    
    func countriesFetchSuccess(countries: [CountryModel]) {
        view?.showCountries(countries: countries)
    }
    
    func countriesFetchFailed() {
        view?.showError()
    }
}

extension MainScreenPresenter: MainScreenModuleInput {
    
}
