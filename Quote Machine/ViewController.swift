//
//  ViewController.swift
//  Quote Machine
//
//  Created by Rinalds Domanovs on 01/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    var quotes = [Quote]()

    var quoteController = QuoteController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quoteController.fetchQuote { (quotes) in
            if let quotes = quotes {
                DispatchQueue.main.async {
                    self.quotes = quotes
                }
            }
        }


        print(quotes)
    }


}

