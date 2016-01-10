//
//  ResulsTableViewController.swift
//  FindBooks
//
//  Created by Bruno Fernandes on 21/12/15.
//  Copyright © 2015 bfs. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    var query: String!
    
    let client = ClientApi()
    var list:[Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! BookTableViewCell
        
        cell.book = list[indexPath.row]
        
        if indexPath.row == list.count - 1{
            client.nextPage()
            loadData()
        }
    

        return cell
    }
    
    private func loadData(){
        
        indicatorView.startAnimating()
        
        client.listBooks(query) { (result) -> () in
            self.list += result
            
            self.updateView()
            
        }
        
    }
    
    private func updateView(){
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.tableView.reloadData()
            self.indicatorView.stopAnimating()
        })
    }
    
}
