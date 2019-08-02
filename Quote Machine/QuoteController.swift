//
//  QuoteController.swift
//  Quote Machine
//
//  Created by Rinalds Domanovs on 02/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

class QuoteController {
    func fetchDailyQuote(completion: @escaping (Contents?) -> Void) {
        let baseURL = URL(string: "http://quotes.rest/qod")!

        let task = URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let quoteInfo = try? jsonDecoder.decode(Contents.self, from: data) {
                completion(quoteInfo)
            } else {
                print("Either no data was returned, or data was not serialized.")
                completion(nil)
            }
        }
        task.resume()
    }
}
