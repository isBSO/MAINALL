//
//  ViewController.swift
//  DashB
//
//  Created by isBSO on 4/25/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit

class DashViewController: UIViewController {
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
            
        //}
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

