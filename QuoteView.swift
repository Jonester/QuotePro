//
//  QuoteView.swift
//  QuotePro
//
//  Created by Chris Jones on 2017-02-15.
//  Copyright © 2017 Jonescr. All rights reserved.
//

import UIKit

class QuoteView: UIView {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteImage: UIImageView!
    @IBOutlet weak var baseView: UIView!
    
    
    @IBAction func randomImage(_ sender: UIButton) {
        self.quoteImage.sd_setImage(with: URL(string: "http://lorempixel.com/200/300"))
    }
    
    @IBAction func randomQuote(_ sender: UIButton) {
        let manager = QuotePhotoManager()
        manager.getRandomQoute {[unowned self] (quoteModel:QuoteModel) in
            DispatchQueue.main.async {
                self.quoteLabel.text = quoteModel.quote
                self.authorLabel.text = quoteModel.author
            }
        }
    }
}
