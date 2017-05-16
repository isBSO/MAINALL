//
//  ViewController.swift
//  DashB
//
//  Created by isBSO on 4/25/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit

class DashViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource = DashData()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dataSource.composeData()
       
        
       // DispatchQueue.main.asyncAfter(deadline: .now() + 5.1) {
            // your code here
            self.collectionView.dataSource = self.dataSource
            self.collectionView.delegate = self.dataSource
        self.dataSource.vc = self
     
            
        //}
        
      
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // your code here
        
        let dash = DashDataSource.shared.items[indexPath.row]
        return     CGSize(width: collectionView.frame.size.width, height: max(collectionView.frame.size.width*dash.dashUI.proportion, dash.dashUI.height))
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

