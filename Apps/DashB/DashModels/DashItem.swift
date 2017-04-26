//
//  DashItem.swift
//  DashB
//
//  Created by isBSO on 4/25/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit

public class DashItem: NSObject {
   public var dashTitle :String = String()
    
   public  func createCompose(_ itemTitle:String)->DashItem{
        let d = DashItem()
        d.dashTitle = itemTitle;
        return d
    }
    
    public  func parse(_ itemsArray:Array<Any>)->Array<DashItem>{
        print(itemsArray);
        var items : Array<DashItem> = []
        for dict in itemsArray {
            print(dict as! NSDictionary)
            let dictionaryValue = dict as! NSDictionary
            let dash = DashItem().createCompose(dictionaryValue["dashTitle"] as! String)
            items.insert(dash, at: 0)
            
        }
      
      return items
    }

}
