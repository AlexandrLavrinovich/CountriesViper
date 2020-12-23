//
//  MainScreenTableViewCell.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 09.09.2020,
//  Copyright © 2020 MacBook Pro. All rights reserved.
//


import UIKit

class CountryCell: UITableViewCell {
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    @IBOutlet weak var smallDescription: UILabel!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
}
