//
//  CardViewController.swift
//  Letters
//
//  Created by 廖姗 on 15/8/23.
//  Copyright (c) 2015年 yulia. All rights reserved.
//

import UIKit


class CardViewController: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    
    var card = UIImage(named: "card1")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
   if (self.card != nil)
   {
        cardImage.image = card
        
    }
        
}

}
