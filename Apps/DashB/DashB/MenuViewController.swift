//
//  MenuViewController.swift
//  DashB
//
//  Created by isBSO on 5/7/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit
import DashModels
class MenuViewController: UIViewController, DataDownloaderProgressDelegate{
    
    @IBOutlet var imateView: UIImageView!
    
    @IBOutlet var subTitleLabell: UILabel!
    @IBOutlet var titleLab: UILabel!
    
    func didFinishDownload(errorOccured: Bool) {
          print("File Failed ")
    }

    var dashDataEach:DashItem = DashItem()
    var dataD :DataDownloader!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imateView.image = dashDataEach.dashUI.imageCache
        
        dataD = DataDownloader(url:"http://www.google.com/" )
        dataD.delegate = self
        
        
        self.view.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // your code here
            self.view.alpha = 1
         
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.000001) {
            // your code here
            
            DImageAnimater.shared.endingRect = self.imateView.frame;
        }
        // Do any additional setup after loading the view.
    }
    func progressUp(progress: Float) {
        print(progress)
      
    }
    


}
