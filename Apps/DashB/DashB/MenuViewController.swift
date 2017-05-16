//
//  MenuViewController.swift
//  DashB
//
//  Created by isBSO on 5/7/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var activeDownloads = [String: DataDownloader]()
    
    lazy var downloadsSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: self as? URLSessionDelegate, delegateQueue: nil)
        return session
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
