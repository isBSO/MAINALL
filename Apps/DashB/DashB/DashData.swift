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
    var items = Array<DashItem> ()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dash = items[indexPath.row]
         if dash.dashType == DashType.event {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "DashEventCollectionViewCell", for: indexPath) as! DashEventCollectionViewCell
            let dash = items[indexPath.row]
            cell.titleLabel.text = dash.dashTitle
            //FullBannerDynamicCollectionViewCell
            cell.imageView.downloadedFrom(link: dash.dashUI.imageUrl)
            return cell;
         }
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "FullBannerDynamicCollectionViewCell", for: indexPath) as! FullBannerDynamicCollectionViewCell
       
     
        cell.imageView.downloadedFrom(link: dash.dashUI.imageUrl)
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // your code here
        
        let dash = items[indexPath.row]
        return     CGSize(width: collectionView.frame.size.width, height: max(collectionView.frame.size.width*dash.dashUI.proportion, dash.dashUI.height))
        
    }
    
    func composeData()  {
 
        //welcome to swift
        let itemsResponse =   DashExtensions().loadLocalJsonFile(fileName: "dashData") as! Array<Any>
        
        
        // wow finally got array
        items = DashItem().parse(itemsResponse)
        
    }

}
