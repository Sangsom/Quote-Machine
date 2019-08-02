//
//  QuoteController.swift
//  Quote Machine
//
//  Created by Rinalds Domanovs on 01/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

class QuoteController {
    let baseURL = URL(string: "http://quotes.rest/qod")!

    func fetchQuote(completion: @escaping ([Quote]?) -> Void) {
        let task = URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let quotes = try? jsonDecoder.decode(Quotes.self, from: data) {
                print(quotes)
                completion(quotes.quotes)
            } else {
                print("failed")
                completion(nil)
            }
        }

        task.resume()
    }
}
