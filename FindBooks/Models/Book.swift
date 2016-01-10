//
//  Book.swift
//  FindBooks
//
//  Created by Bruno Fernandes on 21/12/15.
//  Copyright © 2015 bfs. All rights reserved.
//

import UIKit

class Book {

    var bookId      :String!
    var title       :String!
    var autors      :[String]!
    var imageLinks  :[String:AnyObject]!
    
    init(object:[String:AnyObject]) {
                
        if let bookId  = object["id"] as? String {
            self.bookId   = bookId
        }
        
        let volumeInfo:NSDictionary = object["volumeInfo"] as! NSDictionary
        
        self.title    = volumeInfo["title"] as! String
        
        if let autors:[String] = volumeInfo["authors"] as? Array {
            self.autors = autors
        }
        

        if let imageLinks = volumeInfo["imageLinks"] as? [String:AnyObject] {
            self.imageLinks = imageLinks
        }

    }

}
