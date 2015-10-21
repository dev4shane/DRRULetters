//
//  MenuTable.swift
//  Letters
//
//  Created by 廖姗 on 15/8/26.
//  Copyright (c) 2015年 yulia. All rights reserved.
//

import UIKit

class MenuTable: UITableViewController {

    
    
    var russianLetters = ["Аа", "Бб","Вв","Гг","Дд","Ее","Ёё","Жж","Зз","Ии","Йй","Кк","Лл","Мм","Нн","Оо","Пп","Рр","Сс","Тт","Уу","Фф","Хх","Цц","Чч","Шш","Щщ","ъ","ы","ь","Ээ","Юю","Яя"]
    
    @IBOutlet var menuView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = 120
       self.menuView.separatorStyle = UITableViewCellSeparatorStyle.None
    }

  

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
   
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return russianLetters.count
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 
        cell.textLabel?.text = "\(indexPath.row+1)." + russianLetters[indexPath.row]
        

        return cell
    }
    

   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     if segue.identifier == "toLetter"
     {
        
    let navigationController = segue.destinationViewController as! UINavigationController
    let desController = navigationController.topViewController as! WrittenLetterViewController
    
    let indexPath = self.menuView.indexPathForSelectedRow
        
    var Image = desController.letterImage

    let letterName = "letter"+"\(indexPath!.row+1)"
    
     Image = UIImage(named: letterName)
     desController.letterImage = Image
     desController.row = indexPath!.row
    
    
     
        }
    }
}
