//
//  IntroPageItemView.swift
//  FindBooks
//
//  Created by Bruno Fernandes on 10/01/16.
//  Copyright © 2016 bfs. All rights reserved.
//

import UIKit

class IntroPageItemView: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    // MARK: - Variables
    var itemIndex: Int = 0
    var titleName: String = ""
    var descriptionName: String = ""
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = titleName
        labelDescription.text = descriptionName
        
    }

}
