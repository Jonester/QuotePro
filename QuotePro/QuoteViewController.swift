//
//  QuoteViewController.swift
//  QuotePro
//
//  Created by Chris Jones on 2017-02-15.
//  Copyright © 2017 Jonescr. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {

    var quoteView:QuoteView!
    
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteView = Bundle.main.loadNibNamed("QuoteView", owner: self, options: nil)!.first as! QuoteView
        view.addSubview(quoteView)
    }

}
