//
//  MainScreenMainScreenConfigurator.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 08/09/2020.
//  Copyright © 2020 FlatStack. All rights reserved.
//

import UIKit

class MainScreenModuleConfigurator {
    
    static let sharedInstance = MainScreenModuleConfigurator()

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? MainScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MainScreenViewController) {

        let router = MainScreenRouter()

        let presenter = MainScreenPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MainScreenInteractor()
        interactor.presenter = presenter

        presenter.interactor = interactor
        viewController.presenter = presenter
    }

}
