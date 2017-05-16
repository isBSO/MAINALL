//
//  DataDownloader.swift
//  DashB
//
//  Created by isBSO on 5/7/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit
class DataDownloadManager: NSObject {
var activeDownloads = [String: DataDownloader]()
    
}

class DataDownloader: NSObject,URLSessionDelegate {
    var url: String
    var isDownloading = false
    var progress: Float = 0.0
    
    var downloadTask: URLSessionDownloadTask?
    var resumeData: NSData?
    
    init(url: String) {
        self.url = url
    }

    

}
