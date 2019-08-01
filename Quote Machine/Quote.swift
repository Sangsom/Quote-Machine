//
//  Quote.swift
//  Quote Machine
//
//  Created by Rinalds Domanovs on 01/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

struct Quote: Codable {
    var quote: String
    var author: String
    var category: String
}


struct Quotes: Codable {
    var quotes: [Quote]
}
