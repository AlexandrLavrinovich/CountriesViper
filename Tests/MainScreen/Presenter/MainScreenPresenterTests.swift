//
//  MainScreenMainScreenPresenterTests.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 08/09/2020.
//  Copyright © 2020 FlatStack. All rights reserved.
//

import XCTest

class MainScreenPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: MainScreenInteractorInput {

    }

    class MockRouter: MainScreenRouterInput {

    }

    class MockViewController: MainScreenViewInput {

        func setupInitialState() {

        }
    }
}
