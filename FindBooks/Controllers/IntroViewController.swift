//
//  IntroViewController.swift
//  FindBooks
//
//  Created by Bruno Fernandes on 10/01/16.
//  Copyright © 2016 bfs. All rights reserved.
//

import UIKit

class IntroViewController: UIPageViewController, UIPageViewControllerDataSource {

    var pageControl  :UIPageControl!
    
    // Initialize it right away here
    private let contentTitle = ["Tilte 1","Title 2","Title 3"];
    private let contentDescription = ["Description 1","Description 2","Description 3"];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        setupPage()
        
        if let startingViewController = self.viewControllerAtIndex(0, direction:0) {
            setViewControllers([startingViewController], direction: .Forward, animated: true, completion: nil)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeButtonPressed(){
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var index = 0
        
        index =  (viewController as! IntroPageItemView).itemIndex
        
        self.pageControl.currentPage = index
        index++
        
        return self.viewControllerAtIndex(index , direction:0)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var index = 0
        
        index =  (viewController as! IntroPageItemView).itemIndex
        
        self.pageControl.currentPage = index
        index--
        
        
        return self.viewControllerAtIndex(index , direction:1)
    }
    
    private func viewControllerAtIndex(index: Int , direction: Int) -> UIViewController? {
        
        if index == NSNotFound || index < 0 || index >= self.pageControl.numberOfPages {
            return nil
            
        }
        else {
            
            let pageController = storyboard?.instantiateViewControllerWithIdentifier("IntroPageItemView") as! IntroPageItemView
            pageController.titleName = contentTitle[index]
            pageController.descriptionName = contentDescription[index]
            pageController.itemIndex = index
                
            return pageController
            
            
        }
    }
    
    // MARK: - Page Indicator
    
    private func setupPage(){
        
        view.backgroundColor = UIColor(rgba: "#F5F5F5", alpha: 1.0 )
        
        pageControl = UIPageControl(frame: CGRectMake(0, view.frame.height - 50, view.frame.width, 40))
        pageControl.pageIndicatorTintColor        = UIColor(rgba: "#555555", alpha: 0.9)
        pageControl.currentPageIndicatorTintColor = UIColor(rgba: "#555555", alpha: 0.5)
        pageControl.numberOfPages = contentTitle.count
        pageControl.currentPage = 0
        
        let buttonBack = UIButton()
        buttonBack.frame = CGRectMake(20, 30, 50, 30)
        buttonBack.setTitle("Close", forState: .Normal)
        buttonBack.titleLabel!.font = UIFont(name: "HelveticaNeue", size: 15.0)
        buttonBack.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        buttonBack.addTarget(self, action: "closeButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        
        view.addSubview(buttonBack)
        view.addSubview(pageControl)
        view.bringSubviewToFront(pageControl)
        
    }

}
