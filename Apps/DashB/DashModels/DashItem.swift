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
    case search
    case dashSKU
    case menu
}

public class DashUI: NSObject,NSCoding {
    public var imageUrl :String = String()
    public var viewAllTitle :String = String()
    public var height :CGFloat = 0
    public var imageCache : UIImage  = UIImage()
    public var proportion :CGFloat = 0
    public override init() {
        super.init()
    }
    required public init(coder decoder: NSCoder) {
        self.imageUrl = decoder.decodeObject(forKey: "imageUrl") as? String ?? ""
        self.height = (decoder.decodeObject(forKey: "height") as? CGFloat)!
        if  let imageData = decoder.decodeObject(forKey: "imageCache"){
            self.imageCache = UIImage(data: imageData as! Data)!
        }
        

        //  = decoder.decodeObject(forKey: "imageCache")! as! UIImage
            
        
        self.proportion = (decoder.decodeObject(forKey: "proportion") as? CGFloat)!

    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(imageUrl, forKey: "imageUrl")
        coder.encode(height, forKey: "height")
        // coder.encode(imageCache, forKey: "imageCache")
        
        coder.encode(UIImageJPEGRepresentation(imageCache, 1.0), forKey: "imageCache")
        coder.encode(proportion, forKey: "proportion")
    }
    
}
public class DashItem: NSObject , NSCoding {
    public var dashTitle :String = String()
    public var dashType:DashType {
        set{
            
        }
        get{
            if self.dashTypeString.contains("dashEvent"){
                return DashType.event
            }
            if self.dashTypeString.contains("dashValuePropFull"){
                return DashType.dashValuePropFull
            }
            if self.dashTypeString.contains("dashSearch"){
                return DashType.search
            }
            if self.dashTypeString.contains("dashSKU"){
                return DashType.dashSKU
            }
            
            return DashType.notSet
        }
    }
    
    public var dashTypeString:String  = String()
    public var dashUI:DashUI!
    
    public override init() {
        super.init()
    }
    required public init(coder decoder: NSCoder) {
        self.dashTitle = decoder.decodeObject(forKey: "dashTitle") as? String ?? ""
        self.dashTypeString = decoder.decodeObject(forKey: "dashTypeString") as? String ?? ""
        
        self.dashUI = decoder.decodeObject(forKey: "dashUI")! as! DashUI
        
        
        
        
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(dashTitle, forKey: "dashTitle")
        coder.encode(dashUI, forKey: "dashUI")
        coder.encode(self.dashTypeString, forKey: "dashTypeString")
        
        
    }
    
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
        if dashType.contains("dashSearch"){
            return DashType.search
        }
        if dashType.contains("dashSKU"){
            return DashType.dashSKU
        }
        
        
        
        return DashType.notSet
    }
    

    
    public  func parse(_ itemsArray:Array<Any>)->Array<DashItem>{
//        print(itemsArray);
        var items : Array<DashItem> = []
        for dict in itemsArray {
//            print(dict as! NSDictionary)
            let dictionaryValue = dict as! NSDictionary
            let dash = DashItem().createCompose(dictionaryValue["dashTitle"] as! String)
            dash.dashType = dashtypeFromString(dictionaryValue["dashType"] as! String)
            dash.dashTypeString = dictionaryValue["dashType"]as! String
            dashUI = DashUI()
            let dashUIDict = dictionaryValue["dashUI"] as! NSDictionary
            dashUI.imageUrl = dashUIDict["imageUrl"] as! String
            dashUI.height =  dashUIDict["height"] as! CGFloat
            dashUI.proportion =  dashUIDict["proportion"] as! CGFloat
            dashUI.viewAllTitle =  dashUIDict["viewAllTitle"] as! String
            
            dash.dashUI = dashUI
            items.insert(dash, at: 0)
            
        }
      
      return items
    }
    

}
