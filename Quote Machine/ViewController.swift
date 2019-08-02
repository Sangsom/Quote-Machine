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

    let quoteController = QuoteController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quoteController.fetchDailyQuote { (quoteData) in
            if let quoteData = quoteData,
                let dailyQuote = quoteData.contents.quotes.first {
                    self.updateUI(with: dailyQuote)
            }
        }
    }

    func updateUI(with quoteInfo: Quote) {
        DispatchQueue.main.async {
            self.quoteLabel.text = quoteInfo.quote
            self.authorLabel.text = quoteInfo.author
        }
    }
}

