//
//  DashData.swift
//  DashB
//
//  Created by isBSO on 4/25/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit
import DashModels

class DashData: NSObject, UICollectionViewDataSource {
    var items = Array<DashItem> ()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count;
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "DashEventCollectionViewCell", for: indexPath) as! DashEventCollectionViewCell
        
        cell.titleLabel.text = items[indexPath.row].dashTitle
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func composeData()  {
        let dashItem = DashItem()
        
        items = [dashItem.createCompose("Spring Event ")]
        //welcome to swift
        let itemsResponse =   DashExtensions().loadLocalJsonFile(fileName: "dashData") as! Array<Any>
        
        
        // wow finally got array
        items = DashItem().parse(itemsResponse)
        
    }

}
