//
//  Test1.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 11.09.2020,
//  Copyright © 2020 MacBook Pro. All rights reserved.
//


import Foundation
import UIKit

protocol Test1: UITextFieldDelegate {
    func textFill()
}



class TextFiel: UIViewController {
    @IBOutlet weak var text: UITextField!
     
    @objc func didChangeText(textField: UITextField) {
        print("heelo")
    }
    
}

extension TextFiel: Test1 {
    func textFill() {
        print("ViewController")
    }
}

protocol Test2: UITextFieldDelegate {
    func textFill12()
}




