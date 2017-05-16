//
//  MenuViewController.swift
//  DashB
//
//  Created by isBSO on 5/7/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, DataDownloaderProgressDelegate{
    func didFinishDownload(errorOccured: Bool) {
          print("File Failed ")
    }

    
    var dataD :DataDownloader!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataD = DataDownloader(url:"http://www.google.com/" )
        dataD.delegate = self
        dataD.download()
    
        // Do any additional setup after loading the view.
    }
    func progressUp(progress: Float) {
        print(progress)
      
    }
    


}
