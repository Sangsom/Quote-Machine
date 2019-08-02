//
//  Quote.swift
//  Quote Machine
//
//  Created by Rinalds Domanovs on 02/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

struct Quote: Codable {
    var quote: String
    var author: String
}

struct Quotes: Codable {
    var quotes: [Quote]
}

struct Contents: Codable {
    var contents: Quotes
}
