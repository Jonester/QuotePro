//
//  QuotePhotoManager.swift
//  QuotePro
//
//  Created by Chris Jones on 2017-02-15.
//  Copyright © 2017 Jonescr. All rights reserved.
//

import UIKit

class QuotePhotoManager: NSObject {
    
//    var myProperty: String {
//        didSet {
//            
//        }
//    }

    var photos = [PhotoModel]()
    var quotes = [QuoteModel]()
    
    func getRandomQoute(completionHandler:@escaping (QuoteModel)->Void) {
        
        let url = URL(fileURLWithPath: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
//        let request = URLRequest(url: url)
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration:sessionConfiguration)
        
        let dataTask = session.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
            
            guard let data = data else {
                print("no data returned from server \(error?.localizedDescription)")
                return
            }
            guard let resp = response as? HTTPURLResponse else {
                print("no response returned from server \(error)")
                return
            }
            
            guard resp.statusCode == 200 else {
                // handle error
                print("an error occurred with status code \(resp.statusCode)")
                return
            }
            
            
            var jsonObject:[String: String]?
            
            do {
               jsonObject = try JSONSerialization.jsonObject(with: data) as? Dictionary<String, String>
            }
            catch {
                print(#line, error.localizedDescription)
            }
            
            guard let json = jsonObject else {
                print(#line, "Json could not be downcast")
                return
            }
            
            let quoteText = json["quoteText"] ?? "No Text!"
            let quoteAuthor = json["quoteAuthor"] ?? "Anonymous"
            
            let quote = QuoteModel(quote: quoteText, author:quoteAuthor)
            
            
//            quotes.append(quote)
            completionHandler(quote)
        }
        dataTask.resume()
    }
    
}
