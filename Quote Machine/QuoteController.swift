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

    func fetchDailyQuote(completion: @escaping (QuoteContents?) -> Void) {
        let dailyQuoteURL = baseURL.appendingPathComponent("qod")

        let task = URLSession.shared.dataTask(with: dailyQuoteURL) { (data, response, error) in
            let jsonDecode = JSONDecoder()
            if let data = data,
                let quoteData = try? jsonDecode.decode(QuoteContents.self, from: data) {
                completion(quoteData)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }

    func fetchCategories(completion: @escaping (CategoriesContents?) -> Void) {
        let categoriesURL = baseURL.appendingPathComponent("qod").appendingPathComponent("categories")

        let task = URLSession.shared.dataTask(with: categoriesURL) { (data, response, error) in
            let jsonDecode = JSONDecoder()
            if let data = data,
                let categoriesData = try? jsonDecode.decode(CategoriesContents.self, from: data) {
                completion(categoriesData)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }

    func fetchQuoteByCategory(_ categoryName: String, completion: @escaping (QuoteContents?) -> Void) {
        let quoteURL = baseURL.appendingPathComponent("qod.json?")
        var components = URLComponents(url: quoteURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        let url = components.url!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecode = JSONDecoder()
            if let data = data,
                let quoteData = try? jsonDecode.decode(QuoteContents.self, from: data) {
                completion(quoteData)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
