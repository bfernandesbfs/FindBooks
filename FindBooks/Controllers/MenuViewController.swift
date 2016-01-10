//
//  MenuViewController.swift
//  SlideMenu
//
//  Created by Bruno Fernandes on 06/01/16.
//  Copyright © 2016 BFS. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    var mainViewController: UIViewController!
    var aboutViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainVC = storyboard.instantiateViewControllerWithIdentifier("MainViewController") as! MainViewController
        mainViewController = UINavigationController(rootViewController: mainVC)
        
        let firstVC = storyboard.instantiateViewControllerWithIdentifier("AboutViewController") as! AboutViewController
        aboutViewController = UINavigationController(rootViewController: firstVC)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.slideMenuController()?.changeMainViewController(mainViewController, close: true)
            break
        case 1:
            self.slideMenuController()?.changeMainViewController(aboutViewController, close: true)
            break
        default:
            break
        }
    }
    
    @IBAction func changeMenuPressed(sender: UIButton) {
        
        
        
    }


}
