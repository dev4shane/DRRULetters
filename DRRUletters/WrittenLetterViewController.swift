//
//  ViewController.swift
//  Draw66
//
//  Created by 廖姗 on 15/8/21.
//  Copyright (c) 2015年 yulia. All rights reserved.
//

import UIKit

class WrittenLetterViewController: UIViewController {

    @IBOutlet weak var listbtn: UIBarButtonItem!
    
    
 
    @IBOutlet weak var letterImageView: UIImageView!
 
    
    @IBOutlet weak var drawView: UIImageView!
 
    
    
    var letterImage = UIImage(named: "letter1")
    
    var lastPoint = CGPoint.zero
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var brushWidth: CGFloat = 15.0
    var opacity: CGFloat = 1.0
    var swiped = false
    
    var row = 0

    let userDefaults = NSUserDefaults.standardUserDefaults()
//    选择颜色
    @IBAction func colorChooseBtn(sender: UIButton) {
     
        let btnTag = sender.tag
        
        switch btnTag {
        case 101: red = 255; green = 0.0; blue = 0.0
        case 102: red = 255.0; green = 250.0; blue = 0.0
        case 103: red = 0.0; green = 0.0; blue = 253.0
        case 104: red = 0.0; green = 0.0; blue = 0.0
        default:red = 0.0; green = 0.0; blue = 0


        }
    }
    
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        listbtn.target = self.revealViewController()
        listbtn.action = Selector("revealToggle:")
        
        if letterImage != nil {
            letterImageView.image = letterImage
        
        }
        
        //显示画好的图
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("draw\(row)") as? NSData {
            if let image = UIImage(data: data) {
                drawView.image = image
            }
        }
        
}
    
    
    @IBAction func resetBtn(sender: UIButton) {
    
        userDefaults.removeObjectForKey("draw\(row)")
        drawView.image = nil
        
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        swiped = false
        if let touch = touches.first as UITouch! {
            lastPoint = touch.locationInView(self.drawView)
        }
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        // 取得imageview的context
        UIGraphicsBeginImageContext(drawView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        drawView.image?.drawInRect(CGRect(x: 0, y: 0, width:drawView.frame.size.width, height:drawView.frame.size.height))
        
        //画线
        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
        CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
        
        //线的属性设置
        
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetLineWidth(context, brushWidth)
        CGContextSetRGBStrokeColor(context, red, green, blue, 1.0)
        CGContextSetBlendMode(context, CGBlendMode.Normal)
        
        
        CGContextStrokePath(context)
        
        
        drawView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        drawView.alpha = opacity
        
       
        //把画的线写入userDefaults
        let image = drawView.image
        let data = UIImagePNGRepresentation(image!)
        
        userDefaults.setObject(data, forKey: "draw\(row)")
        userDefaults.synchronize()
        
        
        UIGraphicsEndImageContext()
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        swiped = true
        if let touch = touches.first as UITouch! {
            let currentPoint = touch.locationInView(drawView)
            drawLineFrom(lastPoint, toPoint: currentPoint)
            
            
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if !swiped {
            
            drawLineFrom(lastPoint, toPoint: lastPoint)
        }
    }




}

