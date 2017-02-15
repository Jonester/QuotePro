//
//  QuoteModel.swift
//  QuotePro
//
//  Created by Chris Jones on 2017-02-15.
//  Copyright © 2017 Jonescr. All rights reserved.
//

import UIKit

class QuoteModel: NSObject {

    var quote: String
    var author: String
 
    init(quote:String, author:String) {
        self.quote = quote
        self.author = author
    }
    
}
