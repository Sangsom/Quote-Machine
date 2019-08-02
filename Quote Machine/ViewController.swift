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

        quoteController.fetchDailyQuote { (quoteInfo) in
            if let quoteInfo = quoteInfo {
                self.updateUI(with: quoteInfo.contents.quotes.first!)
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

