//
//  MainScreenMainScreenInteractor.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 08/09/2020.
//  Copyright © 2020 FlatStack. All rights reserved.
//

import Foundation
import Alamofire
class MainScreenInteractor: MainScreenInteractorInput {
    
    weak var presenter: MainScreenInteractorOutput?
    
    var allCountries: [CountryModel]?
    
    func fetchCountries() {
        if let path = Bundle.main.path(forResource: "page1", ofType: "json") {
            let url = URL(fileURLWithPath: path)
            var countries = [CountryModel]()
            AF.request(url).responseString { (response) in
                if let json = response.value?.data(using: .isoLatin1) {
                    let pageModel = try? JSONDecoder().decode(PageModel.self, from: json)
                    guard let page = pageModel else { return }
                    if page.next.isEmpty {
                        countries.append(contentsOf: page.countries)
                        self.allCountries = countries
                        self.presenter?.countriesFetchSuccess(countries: countries)
                    } else {
                        self.fetching(urlString: page.next) { (newCountries) in
                            countries.append(contentsOf: page.countries)
                            countries.append(contentsOf: newCountries)
                            self.allCountries = countries
                            self.presenter?.countriesFetchSuccess(countries: countries)
                        }
                    }

                }
            }
            
        }
    }
    
    func fetchCountry(at index: Int) {
        guard let countries = self.allCountries, countries.indices.contains(index) else { return }
        presenter?.countryFetchSuccess(country: countries[index])
        
    }
    
    private func fetching(urlString: String, completion: @escaping ([CountryModel]) -> ()) {
        var countries = [CountryModel]()
        guard let url = URL(string: urlString) else { return }
        AF.request(url).responseJSON { (response) in
            if let json = response.data {
                let pageModel = try? JSONDecoder().decode(PageModel.self, from: json)
                guard let page = pageModel else { return }
                if page.next.isEmpty {
                    countries.append(contentsOf: page.countries)
                    completion(countries)
                } else {
                    self.fetching(urlString: page.next) { (newCountries) in
                        countries.append(contentsOf: page.countries)
                        countries.append(contentsOf: newCountries)
                        completion(countries)
                    }
                }
            }
        }
    }
}
