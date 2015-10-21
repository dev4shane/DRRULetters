//
//  ViewController.swift
//  Letters
//
//  Created by 廖姗 on 15/8/23.
//  Copyright (c) 2015年 yulia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    用于两个按钮布局用的空图
    @IBOutlet weak var blankView: UIView!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1)
        blankView.backgroundColor = UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1)


        let backButton = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack")
        navigationItem.backBarButtonItem = backButton
    }
    
//    隐藏第一个界面的bar
    override func viewWillAppear(animated: Bool) {
//        var newBackButton = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
//        self.navigationItem.setLeftBarButtonItem(newBackButton, animated: false)
//        
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewWillAppear(Bool())
    }
    
//    显示后面界面的bar
    override func viewDidDisappear(animated: Bool)
    
     {  
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        super.viewWillDisappear(Bool())
        
    }

}

