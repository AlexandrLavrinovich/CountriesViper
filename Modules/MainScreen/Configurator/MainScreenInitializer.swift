//
//  MainScreenMainScreenInitializer.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 08/09/2020.
//  Copyright © 2020 FlatStack. All rights reserved.
//

import UIKit

class MainScreenModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var mainscreenViewController: MainScreenViewController!

    override func awakeFromNib() {
        MainScreenModuleConfigurator.sharedInstance.configureModuleForViewInput(viewInput: self)
//        let configurator = MainScreenModuleConfigurator()
//        configurator.configureModuleForViewInput(viewInput: mainscreenViewController)
    }

}
