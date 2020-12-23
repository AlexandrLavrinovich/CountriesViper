//
//  MainScreenMainScreenConfiguratorTests.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 08/09/2020.
//  Copyright © 2020 FlatStack. All rights reserved.
//

import XCTest

class MainScreenModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = MainScreenViewControllerMock()
        let configurator = MainScreenModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "MainScreenViewController is nil after configuration")
        XCTAssertTrue(viewController.output is MainScreenPresenter, "output is not MainScreenPresenter")

        let presenter: MainScreenPresenter = viewController.output as! MainScreenPresenter
        XCTAssertNotNil(presenter.view, "view in MainScreenPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in MainScreenPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is MainScreenRouter, "router is not MainScreenRouter")

        let interactor: MainScreenInteractor = presenter.interactor as! MainScreenInteractor
        XCTAssertNotNil(interactor.output, "output in MainScreenInteractor is nil after configuration")
    }

    class MainScreenViewControllerMock: MainScreenViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
