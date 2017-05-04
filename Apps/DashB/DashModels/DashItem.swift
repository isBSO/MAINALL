//
//  DashItem.swift
//  DashB
//
//  Created by isBSO on 4/25/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit

public enum DashType {
    case notSet
    case event
    case dashValuePropFull
    case D
}

public class DashUI: NSObject {
    public var imageUrl :String = String()
    public var height :CGFloat = 0
    public var imageCache : UIImage  = UIImage()
    public var proportion :CGFloat = 0
   
}
public class DashItem: NSObject {
   public var dashTitle :String = String()
   public var dashType:DashType = DashType.event
   public var dashUI:DashUI!
    
   public  func createCompose(_ itemTitle:String)->DashItem{
        let d = DashItem()
        d.dashTitle = itemTitle;
        return d
    }
    func dashtypeFromString(_ dashType:String) -> DashType {
        if dashType.contains("dashEvent"){
            return DashType.event
        }
        if dashType.contains("dashValuePropFull"){
            return DashType.dashValuePropFull
        }
        return DashType.notSet
    }
    
    public  func parse(_ itemsArray:Array<Any>)->Array<DashItem>{
        print(itemsArray);
        var items : Array<DashItem> = []
        for dict in itemsArray {
            print(dict as! NSDictionary)
            let dictionaryValue = dict as! NSDictionary
            let dash = DashItem().createCompose(dictionaryValue["dashTitle"] as! String)
            dash.dashType = dashtypeFromString(dictionaryValue["dashType"] as! String)
            dashUI = DashUI()
            let dashUIDict = dictionaryValue["dashUI"] as! NSDictionary
            dashUI.imageUrl = dashUIDict["imageUrl"] as! String
            dashUI.height =  dashUIDict["height"] as! CGFloat
            dashUI.proportion =  dashUIDict["proportion"] as! CGFloat
            
            dash.dashUI = dashUI
            items.insert(dash, at: 0)
            
        }
      
      return items
    }

}
