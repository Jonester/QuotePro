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
    
    var quote: QuoteModel?
    var photo: PhotoModel?
    
    @IBAction func randomImage(_ sender: UIButton) {
      let manager = QuotePhotoManager()
        manager.getRandomPhoto {[unowned self] (photoModel:PhotoModel) in
            DispatchQueue.main.async {
                self.quoteImage.image = photoModel.quoteImage
                self.photo = photoModel
            }
        }
    }
    
    @IBAction func randomQuote(_ sender: UIButton) {
        let manager = QuotePhotoManager()
        manager.getRandomQoute {[unowned self] (quoteModel:QuoteModel) in
            DispatchQueue.main.async {
                self.quoteLabel.text = quoteModel.quote
                self.authorLabel.text = quoteModel.author
                self.quote = quoteModel
            }
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        guard let quote = quote else { return }
        
        QuotePhotoManager.sharedInstance.quotes.append(quote)
        
        
        guard let photo = photo else {return}
        QuotePhotoManager.sharedInstance.photos.append(photo)
        
    }
}
