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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "QOD Categories"

        QuoteController.shared.fetchCategories { (categoriesData) in
            if let categoriesData = categoriesData {
                DispatchQueue.main.async {
                    self.categories = categoriesData.contents.categories
                    self.tableView.reloadData()
                }
            } else {
                let ac = UIAlertController(
                    title: "Loading error",
                    message: "Either no data was returned, or data was not serialized",
                    preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(ac, animated: true)
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
