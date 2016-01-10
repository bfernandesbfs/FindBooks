//
//  ClientApi.swift
//  FindBooks
//
//  Created by Bruno Fernandes on 21/12/15.
//  Copyright © 2015 bfs. All rights reserved.
//

import UIKit


struct Network {
    
    let baseUrl  :String = "https://www.googleapis.com/books/v1/"
    
    var session:NSURLSession? {
        get {
            let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
            return NSURLSession(configuration: sessionConfig)
        }
    }
}

class ClientApi: NSObject {

    private var fields:String = "id,selfLink,volumeInfo"
    private var initial:Int = 0
    private var limit  :Int = 20
    
    func nextPage(){
        initial += limit
    }
    
    // MARK: - Public Method
    func listBooks(query:String, block:(result:[Book]) -> ()){
        
        let network = Network()
        
        let path:String = "\(network.baseUrl)volumes?q=\(query)&fields=items(\(fields))&startIndex=\(initial)&maxResults=\(limit)"
        
        let url = path.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
    
        request(.GET, url).responseJSON { response in
            var list = [Book]()
            
            if let JSON = response.result.value , let items = JSON["items"] as? [AnyObject] {
                for item in items {
                    list.append(Book(object: item as! [String : AnyObject]))
                }
            }
            
            block(result: list)
        }
        
    }
}
