//
//  TemplateDownloaderCollectionViewCell.swift
//  DashB
//
//  Created by isBSO, isBSO on 5/16/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit

class TemplateDownloaderCollectionViewCell: UICollectionViewCell,DataDownloaderProgressDelegate {
    var imageUrl :String!
    var dataD :DataDownloader!
    var progressView : UIProgressView!
    
    
    func downloadImage(imageUrl: String)  {
        self.imageUrl = imageUrl
        dataD = DataDownloader(url:self.imageUrl)
        dataD.delegate = self
        dataD.download()
         progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 10))
        self.addSubview(progressView)
        progressView.backgroundColor = UIColor.green

    }
    
    func progressUp(progress: Float) {
        print(progress)

      
        DispatchQueue.main.async {
           
              self.progressView.backgroundColor = UIColor.green
              self.progressView.setProgress(progress, animated: true)
        }
      
        
    }
    func didFinishDownload(errorOccured: Bool) {
        print("File Failed ")
        DispatchQueue.main.async {
        self.progressView.removeFromSuperview()
            
            
        }
       
    }
    
   
    
}
