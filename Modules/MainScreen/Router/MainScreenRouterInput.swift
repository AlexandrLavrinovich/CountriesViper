//
//  MainScreenMainScreenRouterInput.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 08/09/2020.
//  Copyright © 2020 FlatStack. All rights reserved.
//

import UIKit

protocol MainScreenRouterInput: class {
    static func makeMainScreen() -> UIViewController
}
