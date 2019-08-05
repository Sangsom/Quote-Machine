//
//  QuoteController.swift
//  Quote Machine
//
//  Created by Rinalds Domanovs on 02/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

class QuoteController {
    static let shared = QuoteController()
    
    let baseURL = URL(string: "http://quotes.rest/")!

//    func fetchDailyQuote(completion: @escaping (Contents?) -> Void) {
//        let baseURL = URL(string: "http://quotes.rest/qod")!
//
//        let task = URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
//            let jsonDecoder = JSONDecoder()
//            if let data = data,
//                let quoteInfo = try? jsonDecoder.decode(Contents.self, from: data) {
//                completion(quoteInfo)
//            } else {
//                print("Either no data was returned, or data was not serialized.")
//                completion(nil)
//            }
//        }
//        task.resume()
//    }

    func fetchDailyQuote(completion: @escaping (Contents?) -> Void) {
        let dailyQuoteURL = baseURL.appendingPathComponent("qod")

        let task = URLSession.shared.dataTask(with: dailyQuoteURL) { (data, response, error) in
            let jsonDecode = JSONDecoder()
            if let data = data,
                let quoteData = try? jsonDecode.decode(Contents.self, from: data) {
                completion(quoteData)
            } else {
                print("Either no data was returned, or data was not serialized.")
                completion(nil)
            }
        }
        task.resume()
    }

    func fetchCategories(completion: @escaping (Contents?) -> Void) {
        let categoriesURL = baseURL.appendingPathComponent("qod").appendingPathComponent("categories")

        let task = URLSession.shared.dataTask(with: categoriesURL) { (data, response, error) in
            let jsonDecode = JSONDecoder()
            if let data = data,
                let categoriesData = try? jsonDecode.decode(Contents.self, from: data) {
                completion(categoriesData)
            } else {
                print("Either no data was returned, or data was not serialized.")
                completion(nil)
            }
        }
        task.resume()
    }
}
