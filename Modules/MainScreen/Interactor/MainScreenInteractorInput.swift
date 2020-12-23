//
//  MainScreenMainScreenInteractorInput.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 08/09/2020.
//  Copyright © 2020 FlatStack. All rights reserved.
//

import Foundation

protocol MainScreenInteractorInput: class {

    var presenter: MainScreenInteractorOutput? { get set }
    
    func fetchCountries()
    func fetchCountry(at index: Int)
}
