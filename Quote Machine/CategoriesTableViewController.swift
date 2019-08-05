//
//  CategoriesTableViewController.swift
//  Quote Machine
//
//  Created by Rinalds Domanovs on 05/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {

    var categories: [String: String] = [:]
    var sampleCategories: [String: String] = [
        "inspire": "Inspiring Quote of the day",
        "management": "Management Quote of the day",
        "sports": "Sports Quote of the dat"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "QOD Categories"

//        QuoteController.shared.fetchCategories { (categoriesData) in
//            if let categoriesData = categoriesData {
//                print(categoriesData.contents.categories)
//            }
//        }

//        if let quoteData = quoteData,
//            let dailyQuote = quoteData.contents.quotes.first {
//            self.updateUI(with: dailyQuote)
//        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleCategories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath)
        let categoryItem = Array(sampleCategories)[indexPath.row]
        cell.textLabel?.text = categoryItem.value
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Open VC to see quote by category
    }

}
