//
//  MainViewController.swift
//  FindBooks
//
//  Created by Bruno Fernandes on 21/12/15.
//  Copyright © 2015 bfs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldSearch: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setNavigationBarItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Text Field
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField.text?.characters.count > 3 {
            
            self.performSegueWithIdentifier("segueResults", sender: textField.text)
        
        }
        
        
        return true
    }

    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "segueResults" {
            
            let resultsController = segue.destinationViewController as! ResultsTableViewController
            
            resultsController.query = sender as! String
            
        }
        
    }
    

}
