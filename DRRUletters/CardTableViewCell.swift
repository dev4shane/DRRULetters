//
//  MyTableViewCell.swift
//  Letters
//
//  Created by 廖姗 on 15/8/25.
//  Copyright (c) 2015年 yulia. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var leftImage: UIImageView!
    
    @IBOutlet weak var letterLabel: UILabel!
    
 
    @IBOutlet weak var soundBtnOutlet: UIButton!
    
    override func prepareForReuse() {
        leftImage.image = nil
    }

    
  
    

    

    
    
    
 

}
