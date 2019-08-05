//
//  QuoteByCategoryViewController.swift
//  Quote Machine
//
//  Created by Rinalds Domanovs on 05/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class QuoteByCategoryViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!

    var category: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Category", category)
    }

}
