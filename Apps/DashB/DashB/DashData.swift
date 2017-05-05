//
//  DashData.swift
//  DashB
//
//  Created by isBSO on 4/25/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit
import DashModels

class DashData: NSObject, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
  
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dash = DashDataSource.shared.items[indexPath.row]
         if dash.dashType == DashType.event {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "DashEventCollectionViewCell", for: indexPath) as! DashEventCollectionViewCell
            let dash = DashDataSource.shared.items[indexPath.row]
            cell.titleLabel.text = dash.dashTitle
            //FullBannerDynamicCollectionViewCell
          //  cell.imageView.downloadedFrom(link: dash.dashUI.imageUrl)
       
            dash.downloadedFrom(completion: { (image) in
                cell.imageView.image = image
            })
            return cell;
         }
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "FullBannerDynamicCollectionViewCell", for: indexPath) as! FullBannerDynamicCollectionViewCell
       
     
        dash.downloadedFrom(completion: { (image) in
            cell.imageView.image = image
        })
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DashDataSource.shared.items.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // your code here
        
        let dash = DashDataSource.shared.items[indexPath.row]
        return     CGSize(width: collectionView.frame.size.width, height: max(collectionView.frame.size.width*dash.dashUI.proportion, dash.dashUI.height))
        
    }
    
    func composeData()  {
       
        //welcome to swift
        let itemsResponse =   DashExtensions().loadLocalJsonFile(fileName: "dashData") as! Array<Any>
        
        
        // wow finally got array
         let newItems = DashItem().parse(itemsResponse)
        if newItems.count !=  DashDataSource.shared.items.count{
             DashDataSource.shared.items = newItems
        }
        
        }

}
