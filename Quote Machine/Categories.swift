//
//  Categories.swift
//  Quote Machine
//
//  Created by Rinalds Domanovs on 05/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

struct Categories: Codable {
    var categories: [String: String]
}

struct CategoriesContents: Codable {
    var contents: Categories
}
