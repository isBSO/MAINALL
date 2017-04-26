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
        collectionView.dataSource = dataSource
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

