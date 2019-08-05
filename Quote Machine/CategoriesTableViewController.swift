//
//  CategoriesTableViewController.swift
//  Quote Machine
//
//  Created by Rinalds Domanovs on 05/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {

    //var categories: [String: String] = [:]
    var categories: [String: String] = [
        "inspire": "Inspiring Quote of the day",
        "management": "Management Quote of the day",
        "sports": "Sports Quote of the dat"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "QOD Categories"

        QuoteController.shared.fetchCategories { (categoriesData) in
            if let categoriesData = categoriesData {
                print(categoriesData.contents.categories)
                DispatchQueue.main.async {
                    self.categories = categoriesData.contents.categories
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath)
        let categoryItem = Array(categories)[indexPath.row]
        cell.textLabel?.text = categoryItem.value
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowQuoteIdentifier", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowQuoteIdentifier" {
            let quoteByCategoryViewController = segue.destination as! QuoteByCategoryViewController
            let index = tableView.indexPathForSelectedRow?.row
            let categoryItem = Array(categories)[index!]
            quoteByCategoryViewController.category = categoryItem.key
        }
    }
}
