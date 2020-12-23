//
//  KingfisherService.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 10.09.2020,
//  Copyright © 2020 MacBook Pro. All rights reserved.
//


//import Foundation
import UIKit

extension UIImageView {
    func load(url: URL, with placeholder: UIImage? = nil) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self?.image = placeholder
                }
            }
        }
    }
}
