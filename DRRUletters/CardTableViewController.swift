//
//  CardTableViewController.swift
//  Letters
//
//  Created by 廖姗 on 15/8/24.
//  Copyright (c) 2015年 yulia. All rights reserved.
//

import UIKit
import AVFoundation

class CardTableViewController: UITableViewController {

    
    @IBOutlet weak var cardTableView: UITableView!
  
    




  var russianLetters = ["Аа", "Бб","Вв","Гг","Дд","Ее","Ёё","Жж","Зз","Ии","Йй","Кк","Лл","Мм","Нн","Оо","Пп","Рр","Сс","Тт","Уу","Фф","Хх","Цц","Чч","Шш","Щщ","ъ","ы","ь","Ээ","Юю","Яя"]
  var myletters = singleLetter(cardImageName: [String](), letterLabel: [String](), soundName: [String]())
  var lettersArray = [(String,String,String)]()
  
  var soundFlieURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Sound1", ofType: "mp3")!)
    
  var soundPlayer =  AVAudioPlayer()
   
  var cell = MyTableViewCell()
    
  //添加mode的实例，并把组件统一到一个数组内
  func appendLetter() {
        
        
        
        for var i=0; i < 33; i++ {
            myletters.cardImageName.append("card\(i+1)")
            myletters.letterLabel.append(russianLetters[i])
            myletters.soundName.append("Sound\(i+1)")
    lettersArray.append((myletters.cardImageName[i],myletters.letterLabel[i],myletters.soundName[i]))
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appendLetter()

       let backButton = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack")
        navigationItem.backBarButtonItem = backButton
    
        self.cardTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        
        
        
    }

 

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return lettersArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cardCell", forIndexPath: indexPath) as! MyTableViewCell
        cell.leftImage.image = UIImage(named: "c\(indexPath.row + 1)")
        cell.layer.masksToBounds = true
        cell.letterLabel.text = "\(lettersArray[indexPath.row].1)"
     
        
        
        cell.soundBtnOutlet.setImage(UIImage(named: "sound_icon"), forState: UIControlState.Normal)
        
        cell.soundBtnOutlet.tag = indexPath.row
        
        
        
        //button添加action
        cell.soundBtnOutlet.addTarget(self, action: "soundPlay:", forControlEvents: .TouchUpInside)
        
        return cell
    }
    
    
    
   @IBAction func soundPlay(sender:UIButton!)
    {
        
     
    soundFlieURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Sound\(sender.tag + 1)", ofType: "mp3")!)
      
    soundPlayer = try! AVAudioPlayer(contentsOfURL: soundFlieURL)
      
        
    soundPlayer.play()
        
        
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showCard"
        {
            let showView:CardViewController = segue.destinationViewController as! CardViewController
            let indexpath = self.cardTableView.indexPathForSelectedRow
            var mycard = showView.card
           
            //只能传image
           mycard = UIImage(named: "card\(indexpath!.row+1)")
           showView.card = mycard
           
            
        }
    }
    
}
