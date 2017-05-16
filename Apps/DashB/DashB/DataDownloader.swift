//
//  DataDownloader.swift
//  DashB
//
//  Created by isBSO on 5/7/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit
// here is the protocol for creating the delegation:
protocol DataDownloaderProgressDelegate {
    func progressUp(progress:Float)
    func didFinishDownload(errorOccured:Bool)
}

class DataDownloader: NSObject,URLSessionDownloadDelegate {
    var url: String
    var isDownloading = false
    var downloadProgress: Float = 0.0
    
    // MARK:- Delegate
    var delegate:DataDownloaderProgressDelegate?
    
  
    lazy var downloadsSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        return session
    }()
    var downloadTask: URLSessionDownloadTask!
    
    init(url: String) {
        self.url = url
    }
    func download() {
        if self.isDownloading {
            return
        }
      let url = URL(string: self.url)
        
        self.startDownloading(url: url!)
    }
    func startDownloading (url:URL) {
   downloadTask =  self.downloadsSession.downloadTask(with: url)
        // 3
        self.downloadTask!.resume()
        // 4
        self.isDownloading = true
  
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64){
         downloadProgress = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        self.delegate?.progressUp(progress: downloadProgress)
      
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL){
       
        downloadProgress = 1
        self.delegate?.didFinishDownload(errorOccured: false)
         self.delegate?.progressUp(progress: 1)
    }
    
  
    
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        downloadTask = nil
        downloadProgress = 0.0
        if (error != nil) {
            print("didCompleteWithError \(error?.localizedDescription ?? "tada")")
             self.delegate?.didFinishDownload(errorOccured: false)
        }
        else {
            print("The task finished successfully")
        }
    }


    

}
