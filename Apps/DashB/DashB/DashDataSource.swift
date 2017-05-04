//
//  DashDataSource.swift
//  DashB
//
//  Created by isBSO on 5/3/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit
import DashModels

class DashDataSource: NSObject {
   var items = Array<DashItem> ()
    let lastVersion: Float = 1.01;
    //Very easy Singlton
    
    // Can't init is singleton
    private override init() { }
    
    // MARK: Shared Instance
    
   
    static let shared : DashDataSource = {
        let instance = DashDataSource()
        // entry for restoring shared instance
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(instance, selector: #selector(appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)
        
        // retrieving a value for a key
        if  UserDefaults.standard.float(forKey: "lastVersion") == instance.lastVersion{
            
            if let data = UserDefaults.standard.data(forKey: "PlayersInUserDefaults"){
                instance.items = NSKeyedUnarchiver.unarchiveObject(with: data) as! Array<DashItem>
            }
         
        }
      
      
        return instance
    }()
    
    func appMovedToBackground() {
        print("App moved to background!")
        saveDataToUserDefaults()
    }
    internal func saveDataToUserDefaults(){
        // first we need to convert our array of custom Player objects to a NSData blob, as NSUserDefaults cannot handle arrays of custom objects. It is limited to NSString, NSNumber, NSDate, NSArray, NSData. There are also some convenience methods like setBool, setInteger, ... but of course no convenience method for a custom object
        // note that NSKeyedArchiver will iterate over the 'players' array. So 'encodeWithCoder' will be called for each object in the array (see the print statements)
        let dataBlob = NSKeyedArchiver.archivedData(withRootObject: items)
        
        // now we store the NSData blob in the user defaults
        UserDefaults.standard.set(dataBlob, forKey: "PlayersInUserDefaults")
          UserDefaults.standard.set(lastVersion, forKey: "lastVersion")
        // make sure we save/sync before loading again
        UserDefaults.standard.synchronize()
    }
  
    
    
  
}
extension DashItem {
    // new functionality can be added here
    func downloadedFrom( completion: @escaping (_ resultImage: UIImage) -> Void) {
        if  self.dashUI.imageCache.size.width>0  {
            completion(self.dashUI.imageCache)
            return
        }
        
      
        guard let url = URL(string: self.dashUI.imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
               
                self.dashUI.imageCache = image
                completion(image)
            }
            }.resume()
        
    }
    
}
