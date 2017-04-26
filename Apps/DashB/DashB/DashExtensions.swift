//
//  DashExtensions.swift
//  DashB
//
//  Created by isBSO on 4/25/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit

class DashExtensions: NSObject {
    public func loadLocalJsonFile(fileName:String) ->Any{
        if let path = Bundle.main.path(forResource: "dashData", ofType: "json")
        {
            if let jsonData = NSData(contentsOfFile: path)
            {
                do {
                    let jsonResult: NSArray = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                    print("jsonData:\(jsonResult)")
                    return jsonResult
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }}
        return []
    }
}
