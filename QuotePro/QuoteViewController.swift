//
//  QuoteViewController.swift
//  QuotePro
//
//  Created by Chris Jones on 2017-02-15.
//  Copyright © 2017 Jonescr. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    var quoteView:QuoteView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteView = Bundle.main.loadNibNamed("QuoteView", owner: self, options: nil)!.first as! QuoteView
        view.addSubview(quoteView)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backTapped))
    }
    
    func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

}
