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
    //Very easy Singlton
    
    // Can't init is singleton
    private override init() { }
    
    // MARK: Shared Instance
    
   
    static let shared : DashDataSource = {
        let instance = DashDataSource()
        // entry for restoring shared instance
        return instance
    }()
    func updateItem(item:DashItem, index:NSInteger)  {
        
    }
    
    
  
}
extension DashItem {
    // new functionality can be added here
    func downloadedFrom( completion: @escaping (_ resultImage: UIImage) -> Void) {
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
