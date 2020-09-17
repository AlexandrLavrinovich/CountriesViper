//
//  MainScreenMainScreenViewOutput.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 08/09/2020.
//  Copyright © 2020 FlatStack. All rights reserved.
//

import UIKit

protocol MainScreenViewOutput: class {

    /**
        @author Alexandr Lavrinovich
        Notify presenter that view is ready
    */
    var view: MainScreenViewInput? { get set }
    var interactor: MainScreenInteractorInput? { get set }
    var router: MainScreenRouterInput? { get set }
    
    func beginFetchCountries()
    func showCountry(navigationController: UINavigationController)
    
    func didSelectRowAt(index: Int)
    
//    func viewIsReady()
}
