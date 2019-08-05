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

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "QOD Categories"
    }

}
