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
    var vc:DashViewController?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dash = DashDataSource.shared.items[indexPath.row]
         if dash.dashType == DashType.event {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "DashEventCollectionViewCell", for: indexPath) as! DashEventCollectionViewCell
          
            cell.titleLabel.text = dash.dashTitle
         cell.viewAllButton.setTitle(dash.dashUI.viewAllTitle, for: UIControlState.normal)
       
            dash.downloadedFrom(completion: { (image) in
                cell.imageView.image = image
            })
       
        
            return cell;
         }
        
        if dash.dashType == DashType.menu {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "DashMenuCell", for: indexPath) as! DashMenuCell
            cell.dashTitle.text = dash.dashTitle
            
       
            return cell;
        }
        
        if dash.dashType == DashType.search {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "DashSearchCollectionViewCell", for: indexPath) as! DashSearchCollectionViewCell
            cell.titleLabel.text = dash.dashTitle
            //              cell.dataD = DataDownloader(url:dash.dashUI.imageUrl)
            //          cell.dataD.download(somethingURL: dash.dashUI.imageUrl)
             cell.viewAllButton.setTitle(dash.dashUI.viewAllTitle, for: UIControlState.normal)
            
            return cell;
        }
        if dash.dashType == DashType.dashSKU {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SKUCELL", for: indexPath) as! SKUCELL
            cell.titleLabel.text = dash.dashTitle
            
            cell.viewAllButton.setTitle(dash.dashUI.viewAllTitle, for: UIControlState.normal)
            cell.imageView.image = UIImage(named: "bts")
            
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let viewController:MenuViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as UIViewController as! MenuViewController
        viewController.dashDataEach = DashDataSource.shared.items[indexPath.row]
       DImageAnimater.shared.transitioningImageView = UIImageView()
        
        DImageAnimater.shared.startingRect = collectionView .convert((collectionView.cellForItem(at: indexPath)?.frame)!, to: vc?.view)
         DImageAnimater.shared.transitioningImageView.image =  viewController.dashDataEach.dashUI.imageCache
        DImageAnimater.shared.startAnimating()
        
        
        vc?.navigationController?.pushViewController(viewController, animated: false);
        
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
//        if DashDataSource.shared.items.count<1 {
            DashDataSource.shared.items = DashItem().parse(itemsResponse)
//        }
      //
        
    }

}
