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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var urlString = "http://quotes.rest/qod"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                print("Good", data)
                parse(json: data)
            }
        }
        
    }

    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonQuotes = try? decoder.decode(Contents.self, from: json) {
            DispatchQueue.main.async {
                    self.quotes = jsonQuotes.contents.quotes
                print(self.quotes)
            }
        }
    }

}

