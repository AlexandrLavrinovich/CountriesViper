//
//  CountryModel.swift
//  Countries
//
//  Created by Alexandr Lavrinovich on 09.09.2020,
//  Copyright © 2020 MacBook Pro. All rights reserved.
//


import Foundation
import UIKit

struct PageModel: Decodable {
    var next: String
    var countries: [CountryModel]
    
//    enum CodingKeys: String, CodingKey {
//        case next
//        case countries
//    }
}

struct CountryModel: Decodable {
    var name: String
    var continent: String
    var capital: String
    var population: Int
    var description_small: String
    var description: String
    var image: String
    var country_info: CountryInfo
    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case continent
//        case capital
//        case population
//        case description_small
//        case description
//        case images
//        case country_info
//    }
}

struct CountryInfo: Decodable {
    var images: [String]
    var flag: String
}
