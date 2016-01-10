//
//  BookTableViewCell.swift
//  FindBooks
//
//  Created by Bruno Fernandes on 21/12/15.
//  Copyright © 2015 bfs. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewBook: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelAutor: UILabel!
    
    var book:Book! {
        didSet{
            configureView(book)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageViewBook.af_cancelImageRequest()
        imageViewBook.layer.removeAllAnimations()
        imageViewBook.image = nil
        
    }
    
    private func configureView(book:Book) {
        
        labelTitle.text = book.title
        
        if let autors = book.autors {
            let list:String = autors.joinWithSeparator(", ")
            labelAutor.text = list
        }
        
        if let link = book.imageLinks , let stringUrl = link["thumbnail"] as? String {
            
            let URL = NSURL(string: stringUrl)!
            
            imageViewBook.af_setImageWithURL(URL, placeholderImage: nil, filter: nil, imageTransition: .CrossDissolve(0.2))
            
        }
        
    }
    
}
