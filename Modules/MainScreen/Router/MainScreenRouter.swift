//
//  MainScreenMainScreenRouter.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 08/09/2020.
//  Copyright © 2020 FlatStack. All rights reserved.
//
import UIKit

class MainScreenRouter: MainScreenRouterInput {
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    static func makeMainScreen() -> UIViewController {
        guard let view = mainstoryboard.instantiateViewController(withIdentifier: "CountriesViewController") as? MainScreenViewController else { return UIViewController() }
        let presenter: MainScreenViewOutput & MainScreenInteractorOutput = MainScreenPresenter()
        let interactor: MainScreenInteractorInput = MainScreenInteractor()
        let router: MainScreenRouterInput = MainScreenRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
    
    //MARK: - Navigation
    func pushToCountry(view: MainScreenViewInput, with country: CountryModel) {
        let countryViewController = CountryDetailRouter.makeCountryScreen(with: country)
        
        let mainViewCountroller = view as! MainScreenViewController
        mainViewCountroller.navigationController?.pushViewController(countryViewController, animated: true)
    }
    
    

}
