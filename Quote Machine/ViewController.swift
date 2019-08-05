//
//  ViewController.swift
//  Quote Machine
//
//  Created by Rinalds Domanovs on 01/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let child = SpinnerViewController()

        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)

        QuoteController.shared.fetchDailyQuote { (quoteData) in
            if let quoteData = quoteData,
                let dailyQuote = quoteData.contents.quotes.first {
                    self.updateUI(with: dailyQuote)
                DispatchQueue.main.async {
                    child.willMove(toParent: nil)
                    child.view.removeFromSuperview()
                    child.removeFromParent()
                }
            }
        }
    }

    func updateUI(with quoteInfo: Quote) {
        DispatchQueue.main.async {
            self.navigationItem.title = quoteInfo.title
            self.quoteLabel.text = quoteInfo.quote
            self.authorLabel.text = quoteInfo.author

            // Load image from URL
            if let data = try? Data(contentsOf: quoteInfo.background) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
        }
    }
}

