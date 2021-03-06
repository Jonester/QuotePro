//
//  MasterTableViewController.swift
//  QuotePro
//
//  Created by Chris Jones on 2017-02-15.
//  Copyright © 2017 Jonescr. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "nibCell")
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 130;
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return QuotePhotoManager.sharedInstance.quotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "nibCell", for: indexPath) as? CustomTableViewCell else {
            fatalError()
        }
        
        let quote = QuotePhotoManager.sharedInstance.quotes[indexPath.row]
        let photo = QuotePhotoManager.sharedInstance.photos[indexPath.row]
    
        cell.displayCell(quote: quote, photo: photo)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let activityItem = [QuotePhotoManager.sharedInstance.photos[indexPath.row]]
        let activityViewController = UIActivityViewController(activityItems: activityItem, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.postToFacebook, UIActivityType.openInIBooks, UIActivityType.assignToContact, UIActivityType.print]
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
    // MARK: - Navigation
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let qvc = segue.destination as? QuoteViewController else {
//            fatalError()
//        }
//        
//            
//        }
//    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
